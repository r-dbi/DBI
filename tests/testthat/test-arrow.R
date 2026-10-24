test_that("write arrow to sqlite", {
  skip_if_not_installed("nanoarrow")
  skip_if_not_installed("RSQLite")

  con <- dbConnect(RSQLite::SQLite(), ":memory:")
  on.exit(dbDisconnect(con))

  data <- data.frame(
    a = 1:3,
    b = 2.5,
    c = "three",
    stringsAsFactors = FALSE
  )
  data$d <- blob::blob(as.raw(1:10))

  tbl <- nanoarrow::as_nanoarrow_array_stream(data)

  dbCreateTableArrow(con, "data_tbl", tbl)
  dbAppendTableArrow(con, "data_tbl", tbl)

  tbl$release()

  expect_equal(
    dbReadTable(con, "data_tbl"),
    data
  )

  tbl <- nanoarrow::as_nanoarrow_array_stream(data)

  res <- dbWriteTableArrow(con, "data_tbl", tbl, overwrite = TRUE)

  tbl$release()

  expect_equal(
    dbReadTable(con, "data_tbl"),
    data
  )

  expect_equal(
    as.data.frame(dbReadTableArrow(con, "data_tbl")),
    data
  )

  stream <- dbGetQueryArrow(con, "SELECT COUNT(*) FROM data_tbl")
  expect_equal(
    as.data.frame(stream)[[1]],
    nrow(data)
  )
  stream$release()

  res <- dbSendQueryArrow(con, "SELECT COUNT(*) FROM data_tbl")
  expect_equal(
    as.data.frame(dbFetchArrow(res))[[1]],
    nrow(data)
  )
  dbClearResult(res)

  # Implicit test for dbBind()
  tbl <- nanoarrow::as_nanoarrow_array_stream(data["a"])
  stream <- dbGetQueryArrow(
    con,
    "SELECT * FROM data_tbl WHERE a < $a",
    params = tbl
  )
  expect_equal(
    as.data.frame(stream),
    as.data.frame(data[c(1, 1:2), ], row.names = 1:3)
  )
  tbl$release()
})

test_that("dbFetchArrow() fetches chunks after the first one lazily", {
  skip_if_not_installed("nanoarrow", "0.9.0.9000")
  skip_if_not_installed("RSQLite")

  con <- dbConnect(RSQLite::SQLite(), ":memory:")
  on.exit(dbDisconnect(con))
  dbWriteTable(con, "tbl", data.frame(a = 1:1000))

  res <- dbSendQueryArrow(con, "SELECT * FROM tbl")
  on.exit(dbClearResult(res), add = TRUE, after = FALSE)

  stream <- dbFetchArrow(res)
  expect_false(dbHasCompleted(res))
  expect_named(nanoarrow::infer_nanoarrow_schema(stream)$children, "a")

  expect_equal(as.data.frame(stream), data.frame(a = 1:1000))
  expect_true(dbHasCompleted(res))
})

test_that("dbFetchArrow() fetches all chunks if lazy fetching is disabled", {
  skip_if_not_installed("nanoarrow")
  skip_if_not_installed("RSQLite")

  old <- options(DBI.lazy_arrow = FALSE)
  on.exit(options(old))

  con <- dbConnect(RSQLite::SQLite(), ":memory:")
  on.exit(dbDisconnect(con), add = TRUE, after = FALSE)
  dbWriteTable(con, "tbl", data.frame(a = 1:1000))

  res <- dbSendQueryArrow(con, "SELECT * FROM tbl")
  on.exit(dbClearResult(res), add = TRUE, after = FALSE)

  stream <- dbFetchArrow(res)
  expect_true(dbHasCompleted(res))
  expect_equal(as.data.frame(stream), data.frame(a = 1:1000))
})

test_that("dbGetQueryArrow() clears the result right away without lazy fetching", {
  skip_if_not_installed("nanoarrow")
  skip_if_not_installed("RSQLite")

  old <- options(DBI.lazy_arrow = FALSE)
  on.exit(options(old))

  con <- dbConnect(RSQLite::SQLite(), ":memory:")
  on.exit(dbDisconnect(con), add = TRUE, after = FALSE)
  dbWriteTable(con, "tbl", data.frame(a = 1:1000))

  stream <- dbGetQueryArrow(con, "SELECT * FROM tbl")
  expect_no_warning(dbGetQuery(con, "SELECT 1"))
  expect_equal(as.data.frame(stream), data.frame(a = 1:1000))
})

test_that("an invalid DBI.lazy_arrow option is an error", {
  skip_if_not_installed("nanoarrow")
  skip_if_not_installed("RSQLite")

  old <- options(DBI.lazy_arrow = NULL)
  on.exit(options(old))

  con <- dbConnect(RSQLite::SQLite(), ":memory:")
  on.exit(dbDisconnect(con), add = TRUE, after = FALSE)
  dbWriteTable(con, "tbl", data.frame(a = 1:1000))

  values <- list("yes", NA, logical(0), c(TRUE, FALSE), 1)

  for (value in values) {
    options(DBI.lazy_arrow = value)
    expect_error(
      dbGetQueryArrow(con, "SELECT * FROM tbl"),
      "DBI.lazy_arrow"
    )
    # The result is cleared
    expect_no_warning(dbGetQuery(con, "SELECT 1"))
  }

  res <- dbSendQueryArrow(con, "SELECT * FROM tbl")
  on.exit(dbClearResult(res), add = TRUE, after = FALSE)

  for (value in values) {
    options(DBI.lazy_arrow = value)
    expect_error(dbFetchArrow(res), "DBI.lazy_arrow")
    # Nothing has been fetched yet
    expect_equal(dbGetRowCount(res), 0)
  }

  # Unsetting the option restores the default
  options(DBI.lazy_arrow = NULL)
  stream <- dbFetchArrow(res)
  expect_equal(as.data.frame(stream), data.frame(a = 1:1000))
})

test_that("a lazy stream keeps fetching lazily after the option changes", {
  skip_if_not_installed("nanoarrow", "0.9.0.9000")
  skip_if_not_installed("RSQLite")

  con <- dbConnect(RSQLite::SQLite(), ":memory:")
  on.exit(dbDisconnect(con))
  dbWriteTable(con, "tbl", data.frame(a = 1:1000))

  calls <- 0L
  fetch_chunk <- dbFetchArrowChunk_DBIResultArrow
  local_mocked_bindings(
    dbFetchArrowChunk_DBIResultArrow = function(res, ...) {
      calls <<- calls + 1L
      fetch_chunk(res, ...)
    }
  )

  old <- options(DBI.lazy_arrow = TRUE)
  on.exit(options(old), add = TRUE)
  stream <- dbGetQueryArrow(con, "SELECT * FROM tbl")
  expect_equal(calls, 1L)

  options(DBI.lazy_arrow = FALSE)
  expect_gt(stream$get_next()$length, 0)
  expect_gt(stream$get_next()$length, 0)
  expect_equal(calls, 2L)

  expect_equal(nrow(as.data.frame(stream)), 1000 - 2 * 256)
  expect_no_warning(dbGetQuery(con, "SELECT 1"))
})

test_that("dbGetQueryArrow() clears a lazy result after the last chunk", {
  skip_if_not_installed("nanoarrow", "0.9.0.9000")
  skip_if_not_installed("RSQLite")

  con <- dbConnect(RSQLite::SQLite(), ":memory:")
  on.exit(dbDisconnect(con))
  dbWriteTable(con, "tbl", data.frame(a = 1:1000))

  stream <- dbGetQueryArrow(con, "SELECT * FROM tbl")
  expect_equal(as.data.frame(stream), data.frame(a = 1:1000))

  # A pending result would trigger a warning from RSQLite
  expect_no_warning(dbGetQuery(con, "SELECT 1"))
})

test_that("dbGetQueryArrow() clears a lazy result when the stream is released", {
  skip_if_not_installed("nanoarrow", "0.9.0.9000")
  skip_if_not_installed("RSQLite")

  con <- dbConnect(RSQLite::SQLite(), ":memory:")
  on.exit(dbDisconnect(con))
  dbWriteTable(con, "tbl", data.frame(a = 1:1000))

  stream <- dbGetQueryArrow(con, "SELECT * FROM tbl")
  expect_gt(stream$get_next()$length, 0)
  stream$release()
  expect_no_warning(dbGetQuery(con, "SELECT 1"))

  stream <- dbGetQueryArrow(con, "SELECT * FROM tbl")
  rm(stream)
  gc()
  expect_no_warning(dbGetQuery(con, "SELECT 1"))
})

test_that("dbGetQueryArrow() clears a result that fits in one chunk right away", {
  skip_if_not_installed("nanoarrow")
  skip_if_not_installed("RSQLite")

  con <- dbConnect(RSQLite::SQLite(), ":memory:")
  on.exit(dbDisconnect(con))
  dbWriteTable(con, "tbl", data.frame(a = 1:3))

  stream <- dbGetQueryArrow(con, "SELECT * FROM tbl")
  expect_no_warning(dbGetQuery(con, "SELECT 1"))
  expect_equal(as.data.frame(stream), data.frame(a = 1:3))
})

test_that("dbGetQueryArrow() clears a lazy result when fetching fails", {
  skip_if_not_installed("nanoarrow", "0.9.0.9000")
  skip_if_not_installed("RSQLite")

  con <- dbConnect(RSQLite::SQLite(), ":memory:")
  on.exit(dbDisconnect(con))
  dbWriteTable(con, "tbl", data.frame(a = 1:1000))

  calls <- 0L
  fetch_chunk <- dbFetchArrowChunk_DBIResultArrow
  local_mocked_bindings(
    dbFetchArrowChunk_DBIResultArrow = function(res, ...) {
      calls <<- calls + 1L
      if (calls == 2L) {
        stop("injected fetch failure")
      }
      fetch_chunk(res, ...)
    }
  )

  stream <- dbGetQueryArrow(con, "SELECT * FROM tbl")
  expect_gt(stream$get_next()$length, 0)
  expect_error(stream$get_next(), "injected fetch failure")

  # The result is cleared before the stream is released
  expect_no_warning(dbGetQuery(con, "SELECT 1"))
  expect_no_warning(stream$release())
})

test_that("dbGetQueryArrow() uses a dbFetchArrow() method of a subclass", {
  skip_if_not_installed("nanoarrow")
  skip_if_not_installed("RSQLite")

  setClass(
    "TestResultArrow",
    contains = "DBIResultArrowDefault",
    where = globalenv()
  )
  on.exit(removeClass("TestResultArrow", where = globalenv()))
  setMethod(
    "dbFetchArrow",
    "TestResultArrow",
    function(res, ...) {
      nanoarrow::as_nanoarrow_array_stream(data.frame(a = 999L))
    },
    where = globalenv()
  )
  on.exit(
    removeMethod("dbFetchArrow", "TestResultArrow", where = globalenv()),
    add = TRUE,
    after = FALSE
  )

  con <- dbConnect(RSQLite::SQLite(), ":memory:")
  on.exit(dbDisconnect(con), add = TRUE, after = FALSE)
  dbWriteTable(con, "tbl", data.frame(a = 1:1000))

  setMethod(
    "dbSendQueryArrow",
    "SQLiteConnection",
    function(conn, statement, ...) {
      new("TestResultArrow", result = dbSendQuery(conn, statement, ...))
    },
    where = globalenv()
  )
  on.exit(
    removeMethod("dbSendQueryArrow", "SQLiteConnection", where = globalenv()),
    add = TRUE,
    after = FALSE
  )

  expect_equal(
    as.data.frame(dbGetQueryArrow(con, "SELECT * FROM tbl")),
    data.frame(a = 999L)
  )
  expect_no_warning(dbGetQuery(con, "SELECT 1"))

  # The option applies only to the default method
  old <- options(DBI.lazy_arrow = "yes")
  on.exit(options(old), add = TRUE, after = FALSE)
  expect_equal(
    as.data.frame(dbGetQueryArrow(con, "SELECT * FROM tbl")),
    data.frame(a = 999L)
  )
})

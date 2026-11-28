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

test_that("dbFetchArrow() fetches all chunks by default", {
  skip_if_not_installed("nanoarrow")
  skip_if_not_installed("RSQLite")

  con <- dbConnect(RSQLite::SQLite(), ":memory:")
  on.exit(dbDisconnect(con))
  dbWriteTable(con, "tbl", data.frame(a = 1:1000))

  res <- dbSendQueryArrow(con, "SELECT * FROM tbl")
  on.exit(dbClearResult(res), add = TRUE, after = FALSE)

  stream <- dbFetchArrow(res)
  expect_true(dbHasCompleted(res))
  expect_equal(as.data.frame(stream), data.frame(a = 1:1000))
})

test_that("a dbFetchArrow() stream can be consumed after clearing the result", {
  skip_if_not_installed("nanoarrow")
  skip_if_not_installed("RSQLite")

  con <- dbConnect(RSQLite::SQLite(), ":memory:")
  on.exit(dbDisconnect(con))
  dbWriteTable(con, "tbl", data.frame(a = 1:1000))

  res <- dbSendQueryArrow(con, "SELECT * FROM tbl")
  stream <- dbFetchArrow(res)
  dbClearResult(res)

  expect_equal(as.data.frame(stream), data.frame(a = 1:1000))
})

test_that("dbGetQueryArrow() clears the result right away by default", {
  skip_if_not_installed("nanoarrow")
  skip_if_not_installed("RSQLite")

  con <- dbConnect(RSQLite::SQLite(), ":memory:")
  on.exit(dbDisconnect(con))
  dbWriteTable(con, "tbl", data.frame(a = 1:1000))

  stream <- dbGetQueryArrow(con, "SELECT * FROM tbl")
  # A pending result would trigger a warning from RSQLite
  expect_no_warning(dbGetQuery(con, "SELECT 1"))
  expect_equal(as.data.frame(stream), data.frame(a = 1:1000))
})

test_that("dbReadTableArrow() output can overwrite the table it reads", {
  skip_if_not_installed("nanoarrow")
  skip_if_not_installed("RSQLite")

  con <- dbConnect(RSQLite::SQLite(), ":memory:")
  on.exit(dbDisconnect(con))
  dbWriteTable(con, "t", data.frame(a = 1:1000))

  dbWriteTableArrow(con, "t", dbReadTableArrow(con, "t"), overwrite = TRUE)
  expect_equal(dbGetQuery(con, "SELECT COUNT(*) AS n FROM t")$n, 1000)
})

test_that("check_lazy_arrow() is FALSE without function_array_stream()", {
  skip_if_not_installed("nanoarrow")

  local_mocked_bindings(
    nanoarrow_exports = function() {
      setdiff(
        getNamespaceExports("nanoarrow"),
        "function_array_stream"
      )
    }
  )
  expect_false(check_lazy_arrow())

  local_mocked_bindings(nanoarrow_exports = function() stop("not installed"))
  expect_false(check_lazy_arrow())
})

test_that("has_lazy_arrow() caches the result of check_lazy_arrow()", {
  old <- lazy_arrow_cache$has_lazy_arrow
  on.exit(lazy_arrow_cache$has_lazy_arrow <- old)

  calls <- 0L
  local_mocked_bindings(
    check_lazy_arrow = function() {
      calls <<- calls + 1L
      FALSE
    }
  )

  lazy_arrow_cache$has_lazy_arrow <- NULL
  expect_false(has_lazy_arrow())
  expect_false(has_lazy_arrow())
  expect_equal(calls, 1L)
})

test_that("requesting lazy fetching without the capability fetches eagerly", {
  skip_if_not_installed("nanoarrow")
  skip_if_not_installed("RSQLite")

  con <- dbConnect(RSQLite::SQLite(), ":memory:")
  on.exit(dbDisconnect(con))
  dbWriteTable(con, "tbl", data.frame(a = 1:1000))

  # After on.exit(), which would otherwise discard the restoration of the mock
  local_mocked_bindings(has_lazy_arrow = function() FALSE)

  res <- dbSendQueryArrow(con, "SELECT * FROM tbl")
  stream <- fetch_arrow_stream(res, lazy = TRUE)
  expect_true(dbHasCompleted(res))
  dbClearResult(res)
  expect_equal(as.data.frame(stream), data.frame(a = 1:1000))

  stream <- get_query_arrow(con, "SELECT * FROM tbl", lazy = TRUE)
  expect_no_warning(dbGetQuery(con, "SELECT 1"))
  expect_equal(as.data.frame(stream), data.frame(a = 1:1000))
})

test_that("fetch_arrow_stream() fetches chunks after the first one lazily", {
  skip_if_no_lazy_arrow()
  skip_if_not_installed("RSQLite")

  con <- dbConnect(RSQLite::SQLite(), ":memory:")
  on.exit(dbDisconnect(con))
  dbWriteTable(con, "tbl", data.frame(a = 1:1000))

  res <- dbSendQueryArrow(con, "SELECT * FROM tbl")
  on.exit(dbClearResult(res), add = TRUE, after = FALSE)

  stream <- fetch_arrow_stream(res, lazy = TRUE)
  expect_false(dbHasCompleted(res))
  expect_named(nanoarrow::infer_nanoarrow_schema(stream)$children, "a")

  expect_equal(as.data.frame(stream), data.frame(a = 1:1000))
  expect_true(dbHasCompleted(res))
})

test_that("get_query_arrow() clears a lazy result after the last chunk", {
  skip_if_no_lazy_arrow()
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

  stream <- get_query_arrow(con, "SELECT * FROM tbl", lazy = TRUE)
  expect_equal(calls, 1L)
  expect_equal(as.data.frame(stream), data.frame(a = 1:1000))
  expect_gt(calls, 1L)

  # A pending result would trigger a warning from RSQLite
  expect_no_warning(dbGetQuery(con, "SELECT 1"))
})

test_that("get_query_arrow() clears a lazy result when the stream is released", {
  skip_if_no_lazy_arrow()
  skip_if_not_installed("RSQLite")

  con <- dbConnect(RSQLite::SQLite(), ":memory:")
  on.exit(dbDisconnect(con))
  dbWriteTable(con, "tbl", data.frame(a = 1:1000))

  stream <- get_query_arrow(con, "SELECT * FROM tbl", lazy = TRUE)
  expect_gt(stream$get_next()$length, 0)
  stream$release()
  expect_no_warning(dbGetQuery(con, "SELECT 1"))

  stream <- get_query_arrow(con, "SELECT * FROM tbl", lazy = TRUE)
  rm(stream)
  gc()
  expect_no_warning(dbGetQuery(con, "SELECT 1"))
})

test_that("get_query_arrow() clears a result that fits in one chunk right away", {
  skip_if_not_installed("nanoarrow")
  skip_if_not_installed("RSQLite")

  con <- dbConnect(RSQLite::SQLite(), ":memory:")
  on.exit(dbDisconnect(con))
  dbWriteTable(con, "tbl", data.frame(a = 1:3))

  stream <- get_query_arrow(con, "SELECT * FROM tbl", lazy = TRUE)
  expect_no_warning(dbGetQuery(con, "SELECT 1"))
  expect_equal(as.data.frame(stream), data.frame(a = 1:3))
})

test_that("get_query_arrow() clears a lazy result when fetching fails", {
  skip_if_no_lazy_arrow()
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

  stream <- get_query_arrow(con, "SELECT * FROM tbl", lazy = TRUE)
  expect_gt(stream$get_next()$length, 0)
  expect_error(stream$get_next(), "injected fetch failure")

  # The result is cleared before the stream is released
  expect_no_warning(dbGetQuery(con, "SELECT 1"))
  expect_no_warning(stream$release())
})

test_that("get_query_arrow() uses a dbFetchArrow() method of a subclass", {
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

  expect_equal(
    as.data.frame(get_query_arrow(con, "SELECT * FROM tbl", lazy = TRUE)),
    data.frame(a = 999L)
  )
  expect_no_warning(dbGetQuery(con, "SELECT 1"))
})

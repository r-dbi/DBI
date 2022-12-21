context("arrow")

test_that("write arrow to sqlite", {
  skip_if_not_installed("arrow", "10.0.1")
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

  tbl <- arrow::as_arrow_table(data)

  dbCreateTableArrow(con, "data_tbl", tbl)
  dbAppendTableArrow(con, "data_tbl", tbl)

  expect_equal(
    dbReadTable(con, "data_tbl"),
    as.data.frame(tbl)
  )

  res <- dbWriteTableArrow(con, "data_tbl", tbl, overwrite = TRUE)

  expect_equal(
    dbReadTable(con, "data_tbl"),
    as.data.frame(tbl)
  )

  expect_equal(
    dbReadTableArrow(con, "data_tbl")$read_table(),
    tbl
  )

  stream <- dbGetQueryArrow(con, "SELECT COUNT(*) FROM data_tbl")
  expect_equal(
    as.data.frame(stream$read_table())[[1]],
    nrow(tbl)
  )

  res <- dbSendQueryArrow(con, "SELECT COUNT(*) FROM data_tbl")
  expect_equal(
    as.data.frame(dbFetchArrow(res)$read_table())[[1]],
    nrow(tbl)
  )
  dbClearResult(res)

  # Implicit test for dbBind()
  stream <- dbGetQueryArrow(con, "SELECT * FROM data_tbl WHERE a < $a", params = tbl["a"])
  expect_equal(
    as.data.frame(stream$read_table()),
    as.data.frame(data[c(1, 1:2), ], row.names = 1:3)
  )
})

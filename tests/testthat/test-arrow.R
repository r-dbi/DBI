context("arrow")

test_that("write arrow to sqlite", {
  skip_if_not_installed("arrow")
  skip_if_not_installed("RSQLite")

  con <- dbConnect(RSQLite::SQLite(), ":memory:")
  on.exit(dbDisconnect(con))

  data <- data.frame(
    a = 1L,
    b = 2.5,
    c = "three",
    stringsAsFactors = FALSE
  )

  tbl <- arrow::as_arrow_table(data)

  res <- dbWriteStream(con, "data_tbl", tbl)

  expect_equal(
    dbReadTable(con, "data_tbl"),
    as.data.frame(tbl)
  )

  expect_equal(
    dbStreamTable(con, "data_tbl")$read_table(),
    tbl
  )

  expect_equal(
    as.data.frame(dbGetStream(con, "SELECT COUNT(*) FROM data_tbl")$read_table())[[1]],
    nrow(tbl)
  )

  res <- dbSendQueryArrow(con, "SELECT COUNT(*) FROM data_tbl")
  expect_equal(
    as.data.frame(dbStream(res)$read_table())[[1]],
    nrow(tbl)
  )
  dbClearResult(res)
})
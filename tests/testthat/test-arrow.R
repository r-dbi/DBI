context("arrow")

test_that("write arrow to sqlite", {
  skip_if_not_installed("arrow")
  skip_if_not_installed("RSQLite")

  con <- dbConnect(RSQLite::SQLite(), ":memory:")
  on.exit(dbDisconnect(con))

  tbl <- arrow::as_arrow_table(mtcars)

  res <- dbWriteStream(con, "mtcars_tbl", tbl)

  expect_equal(
    dbReadTable(con, "mtcars_tbl"),
    as.data.frame(tbl)
  )

  expect_equal(
    dbStreamTable(con, "mtcars_tbl")$read_table(),
    tbl
  )
})

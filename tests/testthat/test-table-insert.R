test_that("appending with zero columns throws a dedicated error (#313)", {
  skip_if_not_installed("RSQLite")

  db <- dbConnect(RSQLite::SQLite(), ":memory:")
  on.exit(dbDisconnect(db))

  dbExecute(db, "create table T(n integer primary key)")
  expect_error(dbAppendTable(db, "T", data.frame()), "column")
})

test_that("appending with zero columns throws a dedicated error (#336)", {
  skip_if_not_installed("RSQLite")

  library(RSQLite)
  a <- data.frame(sep = c(1, 2, 3))
  con <- dbConnect(SQLite())
  on.exit(dbDisconnect(con))

  dbWriteTable(con, "a", a)
  expect_equal(dbReadTable(con, "a"), a)
})

test_that("appending with Id works (#380)", {
  skip_if_not_installed("RSQLite")

  db <- dbConnect(RSQLite::SQLite(), ":memory:")
  on.exit(dbDisconnect(db))

  dbExecute(db, "create table T(n integer primary key)")
  expect_equal(dbAppendTable(db, Id(table = "T"), data.frame(n = 1:10)), 10)
})

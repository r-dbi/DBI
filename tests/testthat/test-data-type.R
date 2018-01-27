context("dbDataType")

test_that("dbDataType works on a data frame", {
  df <- data.frame(x = 1:10, y = runif(10))
  types <- dbDataType(MockDriver(), df)

  expect_equal(types, c(x = "INT", y = "DOUBLE"))
})

test_that("dbDataType works on AsIs", {
  drv <- MockDriver()

  int_value <- 1L
  expect_equal(dbDataType(drv, int_value), "INT")
  expect_equal(dbDataType(drv, I(int_value)), "INT")

  date_value <- structure(17455, class = "Date")
  expect_equal(dbDataType(drv, date_value), "DATE")
  expect_equal(dbDataType(drv, I(date_value)), "DATE")
})

context("dbDataType")

test_that("dbDataType works on a data frame", {
  df <- data.frame(x = 1:10, y = runif(10))
  types <- dbDataType(MockDriver(), df)
  
  expect_equal(types, c("int", "double"))
  
})
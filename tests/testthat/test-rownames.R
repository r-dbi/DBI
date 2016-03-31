context("Rowname translation")

test_that("logical row names uses default name", {
  df <- data.frame(x = c(a = 1))

  expect_equal(sqlRownamesToColumn(df, NA)$row_name, "a")
  expect_equal(sqlRownamesToColumn(df, T)$row_name, "a")
  expect_equal(sqlRownamesToColumn(df, F)$row_name, NULL)
})

test_that("character row names uses supplied name", {
  df <- data.frame(x = c(a = 1))

  expect_equal(sqlRownamesToColumn(df, "x")$x, "a")
})

test_that("no rownames in input gives no rownames in output", {
  df <- data.frame(x = 1)
  expect_equal(sqlRownamesToColumn(df, NA)$row_name, NULL)
})

test_that("guess identify of row_names columns", {
  df <- data.frame(row_names = "a", x = 1, stringsAsFactors = FALSE)

  expect_equal(row.names(sqlColumnToRownames(df, NA)), "a")
  expect_equal(row.names(sqlColumnToRownames(df, TRUE)), "a")
  expect_equal(row.names(sqlColumnToRownames(df, FALSE)), "1")
})

test_that("override identify of row_names column", {
  df <- data.frame(x = 1, y = "a", stringsAsFactors = FALSE)

  expect_equal(row.names(sqlColumnToRownames(df, "y")), "a")
  expect_error(row.names(sqlColumnToRownames(df, "z")), "not present")
})

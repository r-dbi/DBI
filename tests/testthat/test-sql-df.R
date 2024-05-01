test_that("NAs turn in NULLs", {
  df <- data.frame(
    x = c(1, NA),
    y = c("a", NA),
    stringsAsFactors = FALSE
  )
  sql_df <- sqlData(ANSI(), df)

  expect_equal(sql_df$x, SQL(c("1.00000000000000000e+00", "NULL")))
  expect_equal(sql_df$y, SQL(c("'a'", "NULL")))
})

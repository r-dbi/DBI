test_that("NAs turn in NULLs", {
  df <- data.frame(
    x = c(1, NA),
    y = c("a", NA),
    stringsAsFactors = FALSE
  )
  sql_df <- sqlData(ANSI(), df)

  expect_equal(sql_df$x, SQL(c("1", "NULL")))
  expect_equal(sql_df$y, SQL(c("'a'", "NULL")))
})

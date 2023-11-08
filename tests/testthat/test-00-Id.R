test_that("Id() requires a character vector", {
  expect_snapshot(Id(1), error = TRUE)
})

test_that("has a decent print method", {
  expect_snapshot(Id("a", "b"))
})

test_that("each element is quoted individually", {
  expect_equal(
    DBI::dbQuoteIdentifier(ANSI(), Id("a", "b.c")),
    SQL('"a"."b.c"')
  )
})

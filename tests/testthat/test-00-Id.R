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

test_that("Id organizes the standard named elements", {
  expect_equal(
    dbQuoteIdentifier(ANSI(), Id(
      "unnamed",
      column = "ultimate",
      table = "last",
      schema = "3rd",
      cluster = '1st',
      catalog = "2nd"
    )),
    SQL('"1st"."2nd"."3rd"."unnamed"."last"."ultimate"')
  )
})

test_that("Id organizes mingled named and unnamed elements; ignores NULL", {
  expect_equal(
    dbQuoteIdentifier(ANSI(), Id(table = "4", some_ref = "2", "3", catalog = "1", cluster = NULL)),
    SQL('"1"."2"."3"."4"')
  )
})

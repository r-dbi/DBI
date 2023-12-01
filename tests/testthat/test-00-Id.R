test_that("Id() requires a character vector", {
  expect_error(Id(1))
})

test_that("has a decent print method", {
  expect_equal(
    utils::capture.output(Id(schema = "a", table = "b")),
    "<Id> \"a\".\"b\""
  )
})

test_that("each element is quoted individually", {
  expect_equal(
    dbQuoteIdentifier(ANSI(), Id("a", "b.c")),
    SQL('"a"."b.c"')
  )
})

test_that("Id organizes the standard named elements", {
 expect_equal(
   dbQuoteIdentifier(ANSI(), Id("unnamed",
                                table = "last", schema = "3rd",
                                cluster = '1st', catalog = "2nd")),
   SQL('"1st"."2nd"."3rd"."unnamed"."last"')
 )
})

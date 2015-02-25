context("sqlInterpolate")

test_that("parameter names matched", {
  expect_equal(
    sqlInterpolate(ANSI(), "?a ?b", a = 1, b = 2),
    SQL("1 2")
  )
  expect_equal(
    sqlInterpolate(ANSI(), "?a ?b", b = 2, a = 1),
    SQL("1 2")
  )
})

test_that("parameters in strings are ignored", {
  expect_equal(
    sqlInterpolate(ANSI(), "'?a'"),
    SQL("'?a'")
  )
})

test_that("parameters in comments are ignored", {
  expect_equal(
    sqlInterpolate(ANSI(), "-- ?a"),
    SQL("-- ?a")
  )
})

test_that("strings are quoted", {
  expect_equal(
    sqlInterpolate(ANSI(), "?a", a = "abc"),
    SQL("'abc'")
  )


})

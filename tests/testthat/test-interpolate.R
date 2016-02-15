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

test_that("some more complex case works as well", {
  expect_equal(
    sqlInterpolate(ANSI(), "asdf ?faa /*fdsa'zsc' */ qwer 'wer' \"bnmvbn\" -- Zc \n '234' ?fuu -- bar", faa = "abc", fuu=42L),
    SQL("asdf 'abc' /*fdsa'zsc' */ qwer 'wer' \"bnmvbn\" -- Zc \n '234' 42 -- bar")
  )
})

test_that("escaping quotes with doubling works", {
  expect_equal(
    sqlInterpolate(ANSI(), "'this is a single '' one ?quoted string' ?bar ", bar=42),
    SQL("'this is a single '' one ?quoted string' 42 ")
  )
})

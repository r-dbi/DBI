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

  expect_equal(
    sqlInterpolate(ANSI(), "?a ?b", b = 2, .dots = list(a = 1)),
    SQL("1 2")
  )

  expect_equal(
    sqlInterpolate(ANSI(), "?a ?b", .dots = list(a = 1, b = 2)),
    SQL("1 2")
  )
})

test_that("parameters in strings are ignored", {
  expect_equal(
    sqlInterpolate(ANSI(), "'? ?fuu'"),
    SQL("'? ?fuu'")
  )
})

test_that("named parameters check matches", {
  expect_error(
    sqlInterpolate(ANSI(), "?a ?b", a = 1, d = 2),
    "Supplied values don't match named vars to interpolate"
  )
})

test_that("positional parameters work", {
  expect_equal(
    sqlInterpolate(ANSI(), "a ? c ? d ", 1, 2),
    SQL("a 1 c 2 d ")
  )
})

test_that("positional parameters can't have names", {
  expect_error(
    sqlInterpolate(ANSI(), "? ?", a = 1, 2),
    "Positional variables don't take named arguments"
  )
})

test_that("parameters in comments are ignored", {
  expect_equal(
    sqlInterpolate(ANSI(), "-- ? ?fuu"),
    SQL("-- ? ?fuu")
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
    sqlInterpolate(ANSI(), "asdf ?faa /*fdsa'zsc' */ qwer 'wer' \"bnmvbn\" -- Zc \n '234' ?fuu -- ? ?bar", faa = "abc", fuu=42L),
    SQL("asdf 'abc' /*fdsa'zsc' */ qwer 'wer' \"bnmvbn\" -- Zc \n '234' 42 -- ? ?bar")
  )
})

test_that("escaping quotes with doubling works", {
  expect_equal(
    sqlInterpolate(ANSI(), "'this is a single '' one ?quoted string' ?bar ", bar=42),
    SQL("'this is a single '' one ?quoted string' 42 ")
  )
})

test_that("corner cases work", {
  expect_equal(
    sqlInterpolate(ANSI(), ""),
    SQL("")
  )
  expect_error(
    sqlInterpolate(ANSI(), "?"),
    "Supplied values don't match positional vars to interpolate"
  )
  expect_equal(
    sqlInterpolate(ANSI(), "?a", a = 1),
    SQL("1")
  )
  expect_equal(
    sqlInterpolate(ANSI(), "\"\""),
    SQL("\"\"")
  )
  expect_error(
    sqlInterpolate(ANSI(), "\""),
    "Unterminated literal"
  )
  expect_equal(
    sqlInterpolate(ANSI(), "?a\"\"?b", a = 1, b = 2),
    SQL("1\"\"2")
  )
  expect_equal(
    sqlInterpolate(ANSI(), "--"),
    SQL("--")
  )
  expect_error(
    sqlInterpolate(ANSI(), "/*"),
    "Unterminated comment"
  )

  # Test escaping rules
  expect_identical(
    sqlParseVariablesImpl(
      "?a '?b\\'?c' ?d '''' ?e",
      list(
        sqlQuoteSpec("'", "'", escape = "\\", doubleEscape = FALSE)
      ),
      list(
      )
    ),
    list(
      start = c(1L, 13L, 21L),
      end = c(2L, 14L, 22L)
    )
  )
})

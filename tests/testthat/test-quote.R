context("quote")

test_that("identifier", {
  expect_equal(dbQuoteIdentifier(ANSI(), character()), SQL(character()))
  expect_equal(dbQuoteIdentifier(ANSI(), "a"), SQL('"a"'))
  expect_equal(dbQuoteIdentifier(ANSI(), "a b"), SQL('"a b"'))

  expect_equal(dbQuoteIdentifier(ANSI(), SQL('"a"')), SQL('"a"'))
  expect_equal(dbQuoteIdentifier(ANSI(), SQL('"a b"')), SQL('"a b"'))
})

test_that("identifier names", {
  expect_equal(dbQuoteIdentifier(ANSI(), setNames(character(), character())), SQL(character(), names = character()))
  expect_equal(dbQuoteIdentifier(ANSI(), c(a = "a")), SQL('"a"', names = "a"))
  expect_equal(dbQuoteIdentifier(ANSI(), c(ab = "a b")), SQL('"a b"', names = "ab"))

  expect_equal(dbQuoteIdentifier(ANSI(), SQL('"a"', names = "a")), SQL('"a"', names = "a"))
  expect_equal(dbQuoteIdentifier(ANSI(), SQL('"a b"', names = "ab")), SQL('"a b"', names = "ab"))
})

test_that("SQL names", {
  expect_null(names(SQL(letters)))
  expect_equal(names(SQL(letters, names = LETTERS)), LETTERS)
  expect_null(names(SQL(setNames(letters, LETTERS))))
})

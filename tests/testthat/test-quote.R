context("quote")

test_that("identifier", {
  expect_equal(dbQuoteIdentifier(ANSI(), character()), SQL(character()))
  expect_equal(dbQuoteIdentifier(ANSI(), "a"), SQL('"a"'))
  expect_equal(dbQuoteIdentifier(ANSI(), "a b"), SQL('"a b"'))

  expect_equal(dbQuoteIdentifier(ANSI(), SQL('"a"')), SQL('"a"'))
  expect_equal(dbQuoteIdentifier(ANSI(), SQL('"a b"')), SQL('"a b"'))
})

test_that("SQL names", {
  expect_null(names(SQL(letters)))
  expect_equal(names(SQL(letters, names = LETTERS)), LETTERS)
  expect_null(names(SQL(setNames(letters, LETTERS))))
})

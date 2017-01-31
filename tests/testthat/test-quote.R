context("quote")

test_that("identifier", {
  expect_equal(dbQuoteIdentifier(ANSI(), character()), SQL(character()))
  expect_equal(dbQuoteIdentifier(ANSI(), "a"), SQL('"a"'))
  expect_equal(dbQuoteIdentifier(ANSI(), "a b"), SQL('"a b"'))

  expect_equal(dbQuoteIdentifier(ANSI(), SQL('"a"')), SQL('"a"'))
  expect_equal(dbQuoteIdentifier(ANSI(), SQL('"a b"')), SQL('"a b"'))
})

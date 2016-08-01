context("Quoting")

test_that("NA becomes NULL", {
  expect_equal(dbQuoteString(ANSI(), NA_character_), SQL("NULL"))
})

test_that("strings surrounded by '", {
  expect_equal(dbQuoteString(ANSI(), "x"), SQL("'x'"))
})

test_that("single quotes are doubled surrounded by '", {
  expect_equal(dbQuoteString(ANSI(), "It's"), SQL("'It''s'"))
})

test_that("special chars are escaped", {
  expect_equal(dbQuoteString(ANSI(), "\n"), SQL("'\n'"))
})

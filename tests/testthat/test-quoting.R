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

test_that("double literals round-trip when default formatting loses precision", {
  x <- c(
    0.0027392760273972603,
    pi,
    123456789.12345679
  )

  sql <- dbQuoteLiteral(ANSI(), x)

  expect_identical(as.numeric(sql), x)
})

test_that("double literals keep simple exact representations when possible", {
  expect_equal(
    dbQuoteLiteral(ANSI(), c(1, 1e20, 1e-20)),
    SQL(c("1", "1e+20", "1e-20"))
  )
})

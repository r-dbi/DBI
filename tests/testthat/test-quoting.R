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

test_that("double literal quoting preserves edge values and names", {
  x <- c(
    smallest = .Machine$double.xmin * .Machine$double.eps,
    largest = .Machine$double.xmax,
    missing = NA_real_
  )

  sql <- dbQuoteLiteral(ANSI(), x)

  expect_identical(names(sql), names(x))
  expect_identical(as.numeric(as.character(sql[1])), x[[1]])
  expect_identical(
    unname(as.character(sql[2])),
    unname(sprintf("%.17g", x[[2]]))
  )
  expect_equal(sql[3], SQL("NULL"))
  expect_equal(
    dbQuoteLiteral(ANSI(), c(Inf, -Inf, NaN)),
    SQL(c("Inf", "-Inf", "NaN"))
  )
})

test_that("double literals holding integers are exact", {
  x <- c(1, 2^53, 2^53 + 2, 1e15, 1e16, -0)

  sql <- dbQuoteLiteral(ANSI(), x)

  expect_equal(
    sql,
    SQL(c("1", "9007199254740992", "9007199254740994", "1e+15", "1e+16", "0"))
  )
  expect_identical(as.numeric(sql), x)
})

test_that("double literals round-trip subnormal values", {
  x <- c(5e-324, .Machine$double.xmin / 3, -.Machine$double.xmin)

  sql <- dbQuoteLiteral(ANSI(), x)

  expect_identical(as.numeric(sql), x)
})

test_that("mixed double vectors only reformat values that do not round-trip", {
  x <- c(a = 0.1, b = 1 / 3, c = NA, d = 100, e = 2 / 3)

  sql <- dbQuoteLiteral(ANSI(), x)

  expect_identical(names(sql), names(x))
  expect_identical(
    unname(as.character(sql)),
    c(
      "0.1",
      sprintf("%.17g", 1 / 3),
      "NULL",
      "100",
      sprintf("%.17g", 2 / 3)
    )
  )
  expect_identical(as.numeric(unname(sql[-3])), unname(x[-3]))
})

test_that("double literals do not depend on the decimal separator of the locale", {
  old <- Sys.getlocale("LC_NUMERIC")
  on.exit(suppressWarnings(Sys.setlocale("LC_NUMERIC", old)), add = TRUE)
  # R warns when LC_NUMERIC is set,
  # and the locale may not be installed.
  ok <- suppressWarnings(Sys.setlocale("LC_NUMERIC", "de_CH.UTF-8"))
  if (!nzchar(ok)) {
    ok <- suppressWarnings(Sys.setlocale("LC_NUMERIC", "de_DE.UTF-8"))
  }
  skip_if_not(nzchar(ok), "No locale with a decimal comma available")

  sql <- dbQuoteLiteral(ANSI(), c(1.5, 1 / 3))

  expect_identical(
    unname(as.character(sql)),
    c("1.5", "0.33333333333333331")
  )
})

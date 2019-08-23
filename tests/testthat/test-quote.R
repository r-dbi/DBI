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

test_that("unquote Id", {
  expect_equal(dbUnquoteIdentifier(ANSI(), Id(table = "a")), list(Id(table = "a")))
  expect_equal(dbUnquoteIdentifier(ANSI(), Id(table = "a", schema = "b")), list(Id(table = "a", schema = "b")))
  expect_equal(dbUnquoteIdentifier(ANSI(), Id(table = "a", schema = "b", catalog = "c")),
               list(Id(table = "a", schema = "b", catalog = "c")))
})

test_that("unquote SQL", {
  expect_equal(dbUnquoteIdentifier(ANSI(), SQL('"a"')), list(Id(table = "a")))
  expect_equal(dbUnquoteIdentifier(ANSI(), SQL("a")), list(Id(table = "a")))
  expect_equal(dbUnquoteIdentifier(ANSI(), SQL('"b"."a"')), list(Id(schema = "b", table = "a")))
  expect_equal(dbUnquoteIdentifier(ANSI(), SQL('b.a')), list(Id(schema = "b", table = "a")))
  expect_equal(dbUnquoteIdentifier(ANSI(), SQL('"c"."b"."a"')),
               list(Id(catalog = "c", schema = "b", table = "a")))
  expect_equal(dbUnquoteIdentifier(ANSI(), SQL('"c"."b"."a"')),
               list(Id(catalog = "c", schema = "b", table = "a")))
  expect_equal(dbUnquoteIdentifier(ANSI(), SQL('c.b.a')),
               list(Id(catalog = "c", schema = "b", table = "a")))
  expect_equal(dbUnquoteIdentifier(ANSI(), SQL('"c"."b.d"."a"')),
               list(Id(catalog = "c", schema = "b.d", table = "a")))
  expect_equal(dbUnquoteIdentifier(ANSI(), SQL('c."b""d".a')),
               list(Id(catalog = "c", schema = 'b"d', table = "a")))
  expect_equal(dbUnquoteIdentifier(ANSI(), SQL(c('"Catalog"."Schema"."Table"', '"UnqualifiedTable"'))),
               list(Id(catalog = "Catalog", schema = "Schema", table = "Table"),
                    Id(table = "UnqualifiedTable")))
})

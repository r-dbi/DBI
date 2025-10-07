test_that("can unquote any number of components", {
  expect_equal(dbUnquoteIdentifier(ANSI(), "a"), list(Id("a")))
  expect_equal(dbUnquoteIdentifier(ANSI(), "a.b"), list(Id("a", "b")))
  expect_equal(dbUnquoteIdentifier(ANSI(), "a.b.c"), list(Id("a", "b", "c")))
  expect_equal(
    dbUnquoteIdentifier(ANSI(), "a.b.c.d"),
    list(Id("a", "b", "c", "d"))
  )
})

test_that("fail with NA input", {
  expect_error(dbUnquoteIdentifier(ANSI(), NA_character_))
  expect_error(dbUnquoteIdentifier(ANSI(), c("a", NA_character_)))
})

test_that("can unquote any quoted components", {
  expect_equal(dbUnquoteIdentifier(ANSI(), '"a.b"'), list(Id("a.b")))

  expect_equal(dbUnquoteIdentifier(ANSI(), 'a."b"'), list(Id("a", "b")))
  expect_equal(dbUnquoteIdentifier(ANSI(), '"a".b'), list(Id("a", "b")))
  expect_equal(dbUnquoteIdentifier(ANSI(), '"a"."b"'), list(Id("a", "b")))

  expect_equal(dbUnquoteIdentifier(ANSI(), '"a"""."b"""'), list(Id('a"', 'b"')))
})

test_that("Id is unchanged and wrapped in list", {
  expect_equal(dbUnquoteIdentifier(ANSI(), Id("foo")), list(Id("foo")))
})

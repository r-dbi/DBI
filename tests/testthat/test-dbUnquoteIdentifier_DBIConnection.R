test_that("unquotes strings", {
  expect_equal(dbUnquoteIdentifier(ANSI(), "foo"), list(Id("foo")))
  expect_equal(dbUnquoteIdentifier(ANSI(), "foo.bar"), list(Id("foo", "bar")))
  expect_equal(dbUnquoteIdentifier(ANSI(), '"foo"."bar"'), list(Id("foo", "bar")))
  expect_equal(dbUnquoteIdentifier(ANSI(), '"f""oo"'), list(Id("f\"oo")))
})

test_that("Id is unchanged but wrapped in list", {
  expect_equal(dbUnquoteIdentifier(ANSI(), Id("foo")), list(Id("foo")))
})

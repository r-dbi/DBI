test_that("OpenTelemetry tracing works", {
  skip_if_not_installed("RSQLite")
  skip_if_not_installed("otel")
  skip_if_not_installed("otelsdk")

  record <- with_otel_record({
    con <- dbConnect(RSQLite::SQLite(), ":memory:")
    dbWriteTable(con, "mtcars", mtcars)
    dbGetQuery(con, "SELECT * FROM `mtcars`")
    dbGetQuery(
      con,
      "SELECT COUNT(*) FROM \nmtcars WHERE cyl = ?",
      params = list(1:8)
    )
    dbReadTable(con, "mtcars")
    dbRemoveTable(con, "mtcars")
    dbDisconnect(con)
  })

  traces <- record$traces

  expect_length(traces, 10L)
  expect_equal(traces[[1L]]$name, "dbConnect RSQLite")
  expect_equal(traces[[1L]]$kind, "client")
  expect_equal(traces[[1L]]$attributes$db.system.name, "RSQLite")
  expect_equal(traces[[2L]]$name, "CREATE TABLE mtcars")
  expect_equal(traces[[2L]]$attributes$db.collection.name, "mtcars")
  expect_equal(traces[[2L]]$attributes$db.operation.name, "CREATE TABLE")
  expect_equal(traces[[3L]]$name, "INSERT INTO mtcars")
  expect_equal(traces[[3L]]$attributes$db.collection.name, "mtcars")
  expect_equal(traces[[3L]]$attributes$db.operation.name, "INSERT INTO")
  expect_equal(traces[[4L]]$name, "dbWriteTable mtcars")
  expect_equal(traces[[4L]]$attributes$db.collection.name, "mtcars")
  expect_equal(traces[[5L]]$name, "SELECT mtcars")
  expect_equal(traces[[5L]]$attributes$db.collection.name, "mtcars")
  expect_equal(traces[[5L]]$attributes$db.operation.name, "SELECT")
  expect_equal(traces[[6L]]$name, "SELECT mtcars")
  expect_equal(traces[[7L]]$name, "SELECT mtcars")
  expect_equal(traces[[8L]]$name, "dbReadTable mtcars")
  expect_equal(traces[[8L]]$attributes$db.collection.name, "mtcars")
  expect_equal(traces[[9L]]$name, "DROP TABLE mtcars")
  expect_equal(traces[[9L]]$attributes$db.collection.name, "mtcars")
  expect_equal(traces[[9L]]$attributes$db.operation.name, "DROP TABLE")
  expect_equal(traces[[10L]]$name, "dbDisconnect RSQLite")
  expect_equal(traces[[10L]]$attributes$db.system.name, "RSQLite")
})

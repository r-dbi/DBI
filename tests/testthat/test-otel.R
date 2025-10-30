test_that("OpenTelemetry tracing works", {
  skip_if_not_installed("otelsdk")

  record <- otelsdk::with_otel_record({
    otel_refresh_tracer("DBI")

    con <- dbConnect(RSQLite::SQLite(), ":memory:")
    dbWriteTable(con, "mtcars", mtcars)
    dbGetQuery(con, "SELECT * FROM mtcars")
    dbGetQuery(
      con,
      "SELECT COUNT(*) FROM mtcars WHERE cyl = ?",
      params = list(1:8)
    )
    dbRemoveTable(con, "mtcars")
    dbDisconnect(con)
  })
  # reset tracer after tests
  otel_refresh_tracer("DBI")

  traces <- record$traces

  expect_length(traces, 6L)
  expect_equal(traces[[1L]]$name, "dbConnect RSQLite")
  expect_equal(traces[[1L]]$kind, "client")
  expect_equal(traces[[1L]]$attributes$db.system.name, "RSQLite")
  expect_equal(traces[[2L]]$name, "CREATE TABLE mtcars")
  expect_equal(traces[[2L]]$attributes$db.collection.name, "mtcars")
  expect_equal(traces[[2L]]$attributes$db.operation.name, "CREATE TABLE")
  expect_equal(traces[[3L]]$name, "SELECT mtcars")
  expect_equal(traces[[3L]]$attributes$db.collection.name, "mtcars")
  expect_equal(traces[[3L]]$attributes$db.operation.name, "SELECT")
  expect_equal(traces[[3L]]$attributes$db.query.text, "<redacted>")
  expect_equal(traces[[4L]]$name, "SELECT mtcars")
  expect_equal(traces[[4L]]$attributes$db.query.text, "SELECT COUNT(*) FROM mtcars WHERE cyl = ?")
  expect_equal(traces[[5L]]$name, "DROP TABLE mtcars")
  expect_equal(traces[[5L]]$attributes$db.collection.name, "mtcars")
  expect_equal(traces[[5L]]$attributes$db.operation.name, "DROP TABLE")
  expect_equal(traces[[6L]]$name, "dbDisconnect RSQLite")
  expect_equal(traces[[6L]]$attributes$db.system.name, "RSQLite")
})

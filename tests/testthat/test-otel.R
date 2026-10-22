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

test_that("query span names stay scalar when SQL has several FROM clauses", {
  skip_if_not_installed("RSQLite")
  skip_if_not_installed("otel")
  skip_if_not_installed("otelsdk")

  con <- dbConnect(RSQLite::SQLite(), ":memory:")
  on.exit(dbDisconnect(con))

  dbWriteTable(con, "a", data.frame(x = 1:3))
  dbWriteTable(con, "b", data.frame(x = 2:3))
  dbWriteTable(con, "c", data.frame(x = 3L))

  record <- expect_no_message(
    with_otel_record({
      dbGetQuery(con, "SELECT * FROM a")
      nested <- dbGetQuery(
        con,
        "SELECT * FROM a WHERE x IN (SELECT x FROM b)"
      )
      dbGetQuery(con, "SELECT * FROM a JOIN b ON a.x = b.x")
      dbGetQuery(con, "SELECT 1")
      dbGetQuery(con, "SELECT * FROM a WHERE EXISTS (SELECT 1 FROM a)")
      triple <- dbGetQuery(
        con,
        paste(
          "SELECT * FROM a",
          "WHERE x IN (SELECT x FROM b WHERE x IN (SELECT x FROM c))"
        )
      )
      list(nested = nested, triple = triple)
    }),
    class = "otel_error_message"
  )

  expect_identical(record$value$nested$x, 2:3)
  expect_identical(record$value$triple$x, 3L)

  traces <- record$traces
  expect_equal(
    unname(vapply(traces, function(trace) trace$name, character(1))),
    c(
      "SELECT a",
      "SELECT a",
      "SELECT a",
      "SELECT RSQLite",
      "SELECT a",
      "SELECT a"
    )
  )
  expect_equal(
    unname(lapply(traces, function(trace) trace$attributes$db.collection.name)),
    list("a", "a", "a", character(), "a", "a")
  )
})

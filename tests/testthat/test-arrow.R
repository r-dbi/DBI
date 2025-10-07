test_that("write arrow to sqlite", {
  skip_if_not_installed("nanoarrow")
  skip_if_not_installed("RSQLite")

  con <- dbConnect(RSQLite::SQLite(), ":memory:")
  on.exit(dbDisconnect(con))

  data <- data.frame(
    a = 1:3,
    b = 2.5,
    c = "three",
    stringsAsFactors = FALSE
  )
  data$d <- blob::blob(as.raw(1:10))

  tbl <- nanoarrow::as_nanoarrow_array_stream(data)

  dbCreateTableArrow(con, "data_tbl", tbl)
  dbAppendTableArrow(con, "data_tbl", tbl)

  tbl$release()

  expect_equal(
    dbReadTable(con, "data_tbl"),
    data
  )

  tbl <- nanoarrow::as_nanoarrow_array_stream(data)

  res <- dbWriteTableArrow(con, "data_tbl", tbl, overwrite = TRUE)

  tbl$release()

  expect_equal(
    dbReadTable(con, "data_tbl"),
    data
  )

  expect_equal(
    as.data.frame(dbReadTableArrow(con, "data_tbl")),
    data
  )

  stream <- dbGetQueryArrow(con, "SELECT COUNT(*) FROM data_tbl")
  expect_equal(
    as.data.frame(stream)[[1]],
    nrow(data)
  )
  stream$release()

  res <- dbSendQueryArrow(con, "SELECT COUNT(*) FROM data_tbl")
  expect_equal(
    as.data.frame(dbFetchArrow(res))[[1]],
    nrow(data)
  )
  dbClearResult(res)

  # Implicit test for dbBind()
  tbl <- nanoarrow::as_nanoarrow_array_stream(data["a"])
  stream <- dbGetQueryArrow(
    con,
    "SELECT * FROM data_tbl WHERE a < $a",
    params = tbl
  )
  expect_equal(
    as.data.frame(stream),
    as.data.frame(data[c(1, 1:2), ], row.names = 1:3)
  )
  tbl$release()
})

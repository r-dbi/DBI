#' Copy Arrow objects to database tables
#'
#' @description
#' `r lifecycle::badge('experimental')`
#'
#' Writes, overwrites or appends an Arrow object to a database table.
#'
#' @details
#' This function expects an Arrow object.
#' Convert a data frame to an Arrow object with [nanoarrow::as_nanoarrow_array_stream()] or
#' use [dbWriteTable()] to write a data frame.
#'
#' This function is useful if you want to create and load a table at the same time.
#' Use [dbAppendTableArrow()] for appending data to an existing
#' table, [dbCreateTableArrow()] for creating a table and specifying field types,
#' and [dbRemoveTable()] for overwriting tables.
#'
#' @template methods
#' @templateVar method_name dbWriteTableArrow
#'
#' @inherit DBItest::spec_arrow_write_table_arrow return
#' @inheritSection DBItest::spec_arrow_write_table_arrow Failure modes
#' @inheritSection DBItest::spec_arrow_write_table_arrow Additional arguments
#' @inheritSection DBItest::spec_arrow_write_table_arrow Specification
#'
#' @inheritParams dbGetQuery
#' @inheritParams dbReadTable
#' @param value An nanoarray stream, or an object coercible to a nanoarray stream with
#'   [nanoarrow::as_nanoarrow_array_stream()].
#' @family DBIConnection generics
#' @export
#' @examplesIf requireNamespace("RSQLite", quietly = TRUE) && requireNamespace("nanoarrow", quietly = TRUE)
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTableArrow(con, "mtcars", nanoarrow::as_nanoarrow_array_stream(mtcars[1:5, ]))
#' dbReadTable(con, "mtcars")
#'
#' dbDisconnect(con)
setGeneric("dbWriteTableArrow", def = function(conn, name, value, ...) {
  otel_local_active_span(
    "dbWriteTableArrow",
    conn,
    label = .dbi_get_collection_name(name, conn),
    attributes = list(db.collection.name = .dbi_get_collection_name(name, conn))
  )
  standardGeneric("dbWriteTableArrow")
})

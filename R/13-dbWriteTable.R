#' Copy data frames to database tables
#'
#' Writes, overwrites or appends a data frame to a database table, optionally
#' converting row names to a column and specifying SQL data types for fields.
#'
#' @details
#' This function expects a data frame.
#' Use [dbWriteTableArrow()] to write an Arrow object.
#'
#' This function is useful if you want to create and load a table at the same time.
#' Use [dbAppendTable()] or [dbAppendTableArrow()] for appending data to an existing
#' table, [dbCreateTable()] or [dbCreateTableArrow()] for creating a table,
#' and [dbExistsTable()] and [dbRemoveTable()] for overwriting tables.
#'
#' DBI only standardizes writing data frames with `dbWriteTable()`.
#' Some backends might implement methods that can consume CSV files
#' or other data formats.
#' For details, see the documentation for the individual methods.
#'
#' @template methods
#' @templateVar method_name dbWriteTable
#'
#' @inherit DBItest::spec_sql_write_table return
#' @inheritSection DBItest::spec_sql_write_table Failure modes
#' @inheritSection DBItest::spec_sql_write_table Additional arguments
#' @inheritSection DBItest::spec_sql_write_table Specification
#'
#' @inheritParams dbGetQuery
#' @inheritParams dbReadTable
#' @param value A [data.frame] (or coercible to data.frame).
#' @family DBIConnection generics
#' @export
#' @examplesIf requireNamespace("RSQLite", quietly = TRUE)
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars[1:5, ])
#' dbReadTable(con, "mtcars")
#'
#' dbWriteTable(con, "mtcars", mtcars[6:10, ], append = TRUE)
#' dbReadTable(con, "mtcars")
#'
#' dbWriteTable(con, "mtcars", mtcars[1:10, ], overwrite = TRUE)
#' dbReadTable(con, "mtcars")
#'
#' # No row names
#' dbWriteTable(con, "mtcars", mtcars[1:10, ], overwrite = TRUE, row.names = FALSE)
#' dbReadTable(con, "mtcars")
setGeneric("dbWriteTable", def = function(conn, name, value, ...) {
  otel_local_active_span(
    "dbWriteTable",
    conn,
    label = .dbi_get_collection_name(name, conn),
    attributes = list(db.collection.name = .dbi_get_collection_name(name, conn))
  )
  standardGeneric("dbWriteTable")
})

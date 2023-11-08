#' Copy data frames to database tables
#'
#' Writes, overwrites or appends a data frame to a database table, optionally
#' converting row names to a column and specifying SQL data types for fields.
#'
#' @details
#' This function is useful if you want to create and load a table at the same time.
#' Use [dbAppendTable()] or [dbAppendTableArrow()] for appending data to an existing
#' table, [dbCreateTable()] or [dbCreateTableArrow()] for creating a table,
#' and [dbExistsTable()] and [dbRemoveTable()] for overwriting tables.
#'
#' DBI only standardizes writing data frames and `ArrowTabular` objects.
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
#' @param value For `dbWriteTable()`, a [data.frame] (or coercible to data.frame).
#'   For `dbWriteTableArrow()`, an object coercible to an Arrow RecordBatchReader.
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
setGeneric("dbWriteTable",
  def = function(conn, name, value, ...) standardGeneric("dbWriteTable")
)

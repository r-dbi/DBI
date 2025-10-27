#' Remove a table from the database
#'
#' Remove a remote table (e.g., created by [dbWriteTable()])
#' from the database.
#'
#' @template methods
#' @templateVar method_name dbRemoveTable
#'
#' @inherit DBItest::spec_sql_remove_table return
#' @inheritSection DBItest::spec_sql_remove_table Failure modes
#' @inheritSection DBItest::spec_sql_remove_table Additional arguments
#' @inheritSection DBItest::spec_sql_remove_table Specification
#'
#' @inheritParams dbReadTable
#' @family DBIConnection generics
#' @export
#' @examplesIf requireNamespace("RSQLite", quietly = TRUE)
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbExistsTable(con, "iris")
#' dbWriteTable(con, "iris", iris)
#' dbExistsTable(con, "iris")
#' dbRemoveTable(con, "iris")
#' dbExistsTable(con, "iris")
#'
#' dbDisconnect(con)
setGeneric("dbRemoveTable", def = function(conn, name, ...) {
  otel_local_active_span(
    "dbRemoveTable",
    conn,
    append = name,
    attributes = list(
      db.collection.name = name,
      db.operation.name = "DROP TABLE"
    )
  )
  standardGeneric("dbRemoveTable")
})

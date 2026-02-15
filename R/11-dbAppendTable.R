#' Insert rows into a table
#'
#' The `dbAppendTable()` method assumes that the table has been created
#' beforehand, e.g. with [dbCreateTable()].
#' The default implementation calls [sqlAppendTableTemplate()] and then
#' [dbExecute()] with the `param` argument.
#' Use [dbAppendTableArrow()] to append data from an Arrow stream.
#'
#' Backends compliant to
#' ANSI SQL 99 which use `?` as a placeholder for prepared queries don't need
#' to override it. Backends with a different SQL syntax which use `?`
#' as a placeholder for prepared queries can override [sqlAppendTable()].
#' Other backends (with different placeholders or with entirely different
#' ways to create tables) need to override the `dbAppendTable()` method.
#'
#' The `row.names` argument is not supported by this method.
#' Process the values with [sqlRownamesToColumn()] before calling this method.
#'
#' @inheritParams dbReadTable
#' @param value A [data.frame] (or coercible to data.frame).
#' @param row.names Must be `NULL`.
#' @inheritParams sqlAppendTableTemplate
#'
#' @template methods
#' @templateVar method_name dbAppendTable
#'
#' @inherit DBItest::spec_sql_append_table return
#' @inheritSection DBItest::spec_sql_append_table Failure modes
#' @inheritSection DBItest::spec_sql_append_table Specification
#'
#' @family DBIConnection generics
#' @export
#' @examplesIf requireNamespace("RSQLite", quietly = TRUE)
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#' dbCreateTable(con, "iris", iris)
#' dbAppendTable(con, "iris", iris)
#' dbReadTable(con, "iris")
#' dbDisconnect(con)
setGeneric(
  "dbAppendTable",
  def = function(conn, name, value, ..., row.names = NULL) {
    otel_local_active_span(
      "INSERT INTO",
      conn,
      label = .dbi_get_collection_name(name, conn),
      attributes = list(
        db.collection.name = .dbi_get_collection_name(name, conn),
        db.operation.name = "INSERT INTO"
      )
    )
    standardGeneric("dbAppendTable")
  }
)

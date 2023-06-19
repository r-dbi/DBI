#' Create a table in the database
#'
#' The default `dbCreateTable()` method calls [sqlCreateTable()] and
#' [dbExecute()].
#' Backends compliant to ANSI SQL 99 don't need to override it.
#' Backends with a different SQL syntax can override `sqlCreateTable()`,
#' backends with entirely different ways to create tables need to
#' override this method.
#'
#' The `row.names` argument is not supported by this method.
#' Process the values with [sqlRownamesToColumn()] before calling this method.
#'
#' The argument order is different from the `sqlCreateTable()` method, the
#' latter will be adapted in a later release of DBI.
#'
#' @inheritParams dbReadTable
#' @param row.names Must be `NULL`.
#' @inheritParams sqlCreateTable
#'
#' @inherit DBItest::spec_sql_create_table return
#' @inheritSection DBItest::spec_sql_create_table Failure modes
#' @inheritSection DBItest::spec_sql_create_table Additional arguments
#' @inheritSection DBItest::spec_sql_create_table Specification
#'
#' @template methods
#' @templateVar method_name dbCreateTable
#'
#' @family DBIConnection generics
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#' dbCreateTable(con, "iris", iris)
#' dbReadTable(con, "iris")
#' dbDisconnect(con)
setGeneric("dbCreateTable",
  def = function(conn, name, fields, ..., row.names = NULL, temporary = FALSE) standardGeneric("dbCreateTable")
)

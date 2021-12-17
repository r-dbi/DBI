#' Insert rows into a table
#'
#' The `dbAppendTable()` method assumes that the table has been created
#' beforehand, e.g. with [dbCreateTable()].
#' The default implementation calls [sqlAppendTableTemplate()] and then
#' [dbExecute()] with the `param` argument. Backends compliant to
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
#' @param value A data frame of values. The column names must be consistent
#'   with those in the target table in the database.
#' @param row.names Must be `NULL`.
#' @inheritParams sqlAppendTableTemplate
#'
#' @inherit DBItest::spec_sql_append_table return
#' @inheritSection DBItest::spec_sql_append_table Failure modes
#' @inheritSection DBItest::spec_sql_append_table Specification
#'
#' @family DBIConnection generics
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#' dbCreateTable(con, "iris", iris)
#' dbAppendTable(con, "iris", iris)
#' dbReadTable(con, "iris")
#' dbDisconnect(con)
setGeneric("dbAppendTable",
  def = function(conn, name, value, ..., row.names = NULL) standardGeneric("dbAppendTable")
)

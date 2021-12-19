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
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbExistsTable(con, "iris")
#' dbWriteTable(con, "iris", iris)
#' dbExistsTable(con, "iris")
#' dbRemoveTable(con, "iris")
#' dbExistsTable(con, "iris")
#'
#' dbDisconnect(con)
setGeneric("dbRemoveTable",
  def = function(conn, name, ...) standardGeneric("dbRemoveTable")
)

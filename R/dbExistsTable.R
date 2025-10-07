#' Does a table exist?
#'
#' Returns if a table given by name exists in the database.
#'
#' @template methods
#' @templateVar method_name dbExistsTable
#'
#' @inherit DBItest::spec_sql_exists_table return
#' @inheritSection DBItest::spec_sql_exists_table Failure modes
#' @inheritSection DBItest::spec_sql_exists_table Specification
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
#'
#' dbDisconnect(con)
setGeneric(
  "dbExistsTable",
  def = function(conn, name, ...) standardGeneric("dbExistsTable"),
  valueClass = "logical"
)

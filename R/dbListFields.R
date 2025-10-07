#' List field names of a remote table
#'
#' Returns the field names of a remote table as a character vector.
#'
#' @inheritParams dbReadTable
#'
#' @template methods
#' @templateVar method_name dbListFields
#'
#' @inherit DBItest::spec_sql_list_fields return
#' @inheritSection DBItest::spec_sql_list_fields Failure modes
#' @inheritSection DBItest::spec_sql_list_fields Specification
#'
#' @family DBIConnection generics
#' @seealso [dbColumnInfo()] to get the type of the fields.
#' @export
#' @examplesIf requireNamespace("RSQLite", quietly = TRUE)
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars)
#' dbListFields(con, "mtcars")
#'
#' dbDisconnect(con)
setGeneric(
  "dbListFields",
  def = function(conn, name, ...) standardGeneric("dbListFields"),
  valueClass = "character"
)

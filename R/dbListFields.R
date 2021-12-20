#' List field names of a remote table
#'
#' @inheritParams dbReadTable
#'
#' @inherit DBItest::spec_sql_list_fields return
#' @inheritSection DBItest::spec_sql_list_fields Failure modes
#' @inheritSection DBItest::spec_sql_list_fields Specification
#'
#' @family DBIConnection generics
#' @seealso [dbColumnInfo()] to get the type of the fields.
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars)
#' dbListFields(con, "mtcars")
#'
#' dbDisconnect(con)
setGeneric("dbListFields",
  def = function(conn, name, ...) standardGeneric("dbListFields"),
  valueClass = "character"
)

#' Copy data frames from database tables
#'
#' Reads a database table to a data frame, optionally converting
#' a column to row names and converting the column names to valid
#' R identifiers.
#'
#' @template methods
#' @templateVar method_name dbReadTable
#'
#' @inherit DBItest::spec_sql_read_table return
#' @inheritSection DBItest::spec_sql_read_table Failure modes
#' @inheritSection DBItest::spec_sql_read_table Additional arguments
#' @inheritSection DBItest::spec_sql_read_table Specification
#'
#' @inheritParams dbGetQuery
#' @param name The table name, passed on to [dbQuoteIdentifier()]. Options are:
#'   - a character string with the unquoted DBMS table name,
#'     e.g. `"table_name"`,
#'   - a call to [Id()] with components to the fully qualified table name,
#'     e.g. `Id(schema = "my_schema", table = "table_name")`
#'   - a call to [SQL()] with the quoted and fully qualified table name
#'     given verbatim, e.g. `SQL('"my_schema"."table_name"')`
#' @family DBIConnection generics
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars[1:10, ])
#' dbReadTable(con, "mtcars")
#'
#' dbDisconnect(con)
setGeneric("dbReadTable",
  def = function(conn, name, ...) standardGeneric("dbReadTable"),
  valueClass = "data.frame"
)

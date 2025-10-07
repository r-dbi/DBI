#' Compose query to create a simple table
#'
#' Exposes an interface to simple `CREATE TABLE` commands. The default
#' method is ANSI SQL 99 compliant.
#' This method is mostly useful for backend implementers.
#'
#' The `row.names` argument must be passed explicitly in order to avoid
#' a compatibility warning.  The default will be changed in a later release.
#'
#' @param con A database connection.
#' @param table The table name, passed on to [dbQuoteIdentifier()]. Options are:
#'   - a character string with the unquoted DBMS table name,
#'     e.g. `"table_name"`,
#'   - a call to [Id()] with components to the fully qualified table name,
#'     e.g. `Id(schema = "my_schema", table = "table_name")`
#'   - a call to [SQL()] with the quoted and fully qualified table name
#'     given verbatim, e.g. `SQL('"my_schema"."table_name"')`
#' @param fields Either a character vector or a data frame.
#'
#'   A named character vector: Names are column names, values are types.
#'   Names are escaped with [dbQuoteIdentifier()].
#'   Field types are unescaped.
#'
#'   A data frame: field types are generated using
#'   [dbDataType()].
#' @param temporary If `TRUE`, will generate a temporary table.
#' @inheritParams rownames
#' @param ... Other arguments used by individual methods.
#'
#' @template methods
#' @templateVar method_name sqlCreateTable
#'
#' @export
#' @examples
#' sqlCreateTable(ANSI(), "my-table", c(a = "integer", b = "text"))
#' sqlCreateTable(ANSI(), "my-table", iris)
#'
#' # By default, character row names are converted to a row_names colum
#' sqlCreateTable(ANSI(), "mtcars", mtcars[, 1:5])
#' sqlCreateTable(ANSI(), "mtcars", mtcars[, 1:5], row.names = FALSE)
setGeneric(
  "sqlCreateTable",
  def = function(con, table, fields, row.names = NA, temporary = FALSE, ...) {
    standardGeneric("sqlCreateTable")
  }
)

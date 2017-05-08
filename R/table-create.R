#' Create a simple table
#'
#' Exposes interface to simple `CREATE TABLE` commands. The default
#' method is ANSI SQL 99 compliant.
#' This method is mostly useful for backend implementers.
#'
#' @section DBI-backends:
#' If you implement one method (i.e. for strings or data frames), you need
#' to implement both, otherwise the S4 dispatch rules will be ambiguous
#' and will generate an error on every call.
#'
#' @param con A database connection.
#' @param table Name of the table. Escaped with
#'   [dbQuoteIdentifier()].
#' @param fields Either a character vector or a data frame.
#'
#'   A named character vector: Names are column names, values are types.
#'   Names are escaped with [dbQuoteIdentifier()].
#'   Field types are unescaped.
#'
#'   A data frame: field types are generated using
#'   [dbDataType()].
#' @param temporary If `TRUE`, will generate a temporary table statement.
#' @inheritParams rownames
#' @param ... Other arguments used by individual methods.
#' @export
#' @examples
#' sqlCreateTable(ANSI(), "my-table", c(a = "integer", b = "text"))
#' sqlCreateTable(ANSI(), "my-table", iris)
#'
#' # By default, character row names are converted to a row_names colum
#' sqlCreateTable(ANSI(), "mtcars", mtcars[, 1:5])
#' sqlCreateTable(ANSI(), "mtcars", mtcars[, 1:5], row.names = FALSE)
setGeneric("sqlCreateTable",
  def = function(con, table, fields, row.names = NA, temporary = FALSE, ...) standardGeneric("sqlCreateTable")
)

#' @rdname hidden_aliases
#' @export
setMethod("sqlCreateTable", "DBIConnection",
  function(con, table, fields, row.names = NA, temporary = FALSE, ...) {
    table <- dbQuoteIdentifier(con, table)

    if (is.data.frame(fields)) {
      fields <- sqlRownamesToColumn(fields, row.names)
      fields <- vapply(fields, function(x) DBI::dbDataType(con, x), character(1))
    }

    field_names <- dbQuoteIdentifier(con, names(fields))
    field_types <- unname(fields)
    fields <- paste0(field_names, " ", field_types)

    SQL(paste0(
      "CREATE ", if (temporary) "TEMPORARY ", "TABLE ", table, " (\n",
      "  ", paste(fields, collapse = ",\n  "), "\n)\n"
    ))
  }
)

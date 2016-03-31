#' Insert rows into a table.
#'
#' \code{sqlAppendTable} generates a single SQL string that inserts a
#' data frame into an existing table. \code{sqlAppendTableTemplate} generates
#' a template suitable for use with \code{\link{dbBind}}.
#'
#' @inheritParams sqlCreateTable
#' @inheritParams rownames
#' @param values A data frame. Factors will be converted to character vectors.
#'   Character vectors will be escaped with \code{\link[DBI]{dbQuoteString}}.
#' @family SQL generation
#' @export
#' @examples
#' sqlAppendTable(ANSI(), "iris", head(iris))
#'
#' sqlAppendTable(ANSI(), "mtcars", head(mtcars))
#' sqlAppendTable(ANSI(), "mtcars", head(mtcars), row.names = FALSE)
setGeneric("sqlAppendTable", function(con, table, values, row.names = NA,
                                          ...) {
  standardGeneric("sqlAppendTable")
})

#' @export
#' @rdname sqlAppendTable
setMethod("sqlAppendTable", "DBIConnection",
  function(con, table, values, row.names = NA, ...) {
    stopifnot(is.data.frame(values))

    sql_values <- sqlData(con, values, row.names)
    table <- dbQuoteIdentifier(con, table)
    fields <- dbQuoteIdentifier(con, names(sql_values))

    # Convert fields into a character matrix
    rows <- do.call(paste, c(sql_values, sep = ", "))
    SQL(paste0(
      "INSERT INTO ", table, "\n",
      "  (", paste(fields, collapse = ", "), ")\n",
      "VALUES\n",
      paste0("  (", rows, ")", collapse = ",\n")
    ))
  }
)

#' @inheritParams sqlCreateTable
#' @inheritParams sqlAppendTable
#' @inheritParams rownames
#' @param prefix Parameter prefix to put in front of column id.
#' @export
#' @rdname sqlAppendTable
#' @examples
#' sqlAppendTableTemplate(ANSI(), "iris", iris)
#'
#' sqlAppendTableTemplate(ANSI(), "mtcars", mtcars)
#' sqlAppendTableTemplate(ANSI(), "mtcars", mtcars, row.names = FALSE)
sqlAppendTableTemplate <- function(con, table, values, row.names = NA, prefix = "?", ...) {
  table <- dbQuoteIdentifier(con, table)

  values <- sqlRownamesToColumn(values[0, , drop = FALSE], row.names)
  fields <- dbQuoteIdentifier(con, names(values))

  # Convert fields into a character matrix
  SQL(paste0(
    "INSERT INTO ", table, "\n",
    "  (", paste(fields, collapse = ", "), ")\n",
    "VALUES\n",
    paste0("  (", paste0(prefix, seq_along(fields), collapse = ", "), ")", collapse = ",\n")
  ))
}

#' Compose query to insert rows into a table
#'
#' `sqlAppendTable()` generates a single SQL string that inserts a
#' data frame into an existing table. `sqlAppendTableTemplate()` generates
#' a template suitable for use with [dbBind()].
#' The default methods are ANSI SQL 99 compliant.
#' These methods are mostly useful for backend implementers.
#'
#' The `row.names` argument must be passed explicitly in order to avoid
#' a compatibility warning.  The default will be changed in a later release.
#'
#' @inheritParams sqlCreateTable
#' @inheritParams rownames
#' @param values A data frame. Factors will be converted to character vectors.
#'   Character vectors will be escaped with [dbQuoteString()].
#' @family SQL generation
#' @export
#' @examples
#' sqlAppendTable(ANSI(), "iris", head(iris))
#'
#' sqlAppendTable(ANSI(), "mtcars", head(mtcars))
#' sqlAppendTable(ANSI(), "mtcars", head(mtcars), row.names = FALSE)
setGeneric("sqlAppendTable",
  def = function(con, table, values, row.names = NA, ...) standardGeneric("sqlAppendTable")
)

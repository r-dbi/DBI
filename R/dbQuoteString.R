#' Quote literal strings
#'
#' Call this method to generate a string that is suitable for
#' use in a query as a string literal, to make sure that you
#' generate valid SQL and protect against SQL injection attacks.
#'
#' @inheritParams dbGetQuery
#' @param x A character vector to quote as string.
#' @param ... Other arguments passed on to methods.
#'
#' @template methods
#' @templateVar method_name dbQuoteString
#'
#' @inherit DBItest::spec_sql_quote_string return
#' @inheritSection DBItest::spec_sql_quote_string Failure modes
#' @inheritSection DBItest::spec_sql_quote_string Specification
#'
#' @family DBIResult generics
#' @export
#' @examples
#' # Quoting ensures that arbitrary input is safe for use in a query
#' name <- "Robert'); DROP TABLE Students;--"
#' dbQuoteString(ANSI(), name)
#'
#' # NAs become NULL
#' dbQuoteString(ANSI(), c("x", NA))
#'
#' # SQL vectors are always passed through as is
#' var_name <- SQL("select")
#' var_name
#' dbQuoteString(ANSI(), var_name)
#'
#' # This mechanism is used to prevent double escaping
#' dbQuoteString(ANSI(), dbQuoteString(ANSI(), name))
setGeneric("dbQuoteString", def = function(conn, x, ...) {
  standardGeneric("dbQuoteString")
})

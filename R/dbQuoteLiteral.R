#' Quote literal values
#'
#' @description
#' Call these methods to generate a string that is suitable for
#' use in a query as a literal value of the correct type, to make sure that you
#' generate valid SQL and protect against SQL injection attacks.
#'
#' @inheritParams dbQuoteString
#' @param x A vector to quote as string.
#'
#' @template methods
#' @templateVar method_name dbQuoteLiteral
#'
#' @inherit DBItest::spec_sql_quote_literal return
#' @inheritSection DBItest::spec_sql_quote_literal Failure modes
#' @inheritSection DBItest::spec_sql_quote_literal Specification
#'
#' @family DBIResult generics
#' @export
#' @examples
#' # Quoting ensures that arbitrary input is safe for use in a query
#' name <- "Robert'); DROP TABLE Students;--"
#' dbQuoteLiteral(ANSI(), name)
#'
#' # NAs become NULL
#' dbQuoteLiteral(ANSI(), c(1:3, NA))
#'
#' # Logicals become integers by default
#' dbQuoteLiteral(ANSI(), c(TRUE, FALSE, NA))
#'
#' # Raw vectors become hex strings by default
#' dbQuoteLiteral(ANSI(), list(as.raw(1:3), NULL))
#'
#' # SQL vectors are always passed through as is
#' var_name <- SQL("select")
#' var_name
#' dbQuoteLiteral(ANSI(), var_name)
#'
#' # This mechanism is used to prevent double escaping
#' dbQuoteLiteral(ANSI(), dbQuoteLiteral(ANSI(), name))
setGeneric("dbQuoteLiteral", def = function(conn, x, ...) {
  standardGeneric("dbQuoteLiteral")
})

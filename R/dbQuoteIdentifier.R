#' Quote identifiers
#'
#' Call this method to generate a string that is suitable for
#' use in a query as a column or table name, to make sure that you
#' generate valid SQL and protect against SQL injection attacks. The inverse
#' operation is [dbUnquoteIdentifier()].
#'
#' @inheritParams dbGetQuery
#' @param x A character vector, [SQL] or [Id] object to quote as identifier.
#' @param ... Other arguments passed on to methods.
#'
#' @template methods
#' @templateVar method_name dbQuoteIdentifier
#'
#' @inherit DBItest::spec_sql_quote_identifier return
#' @inheritSection DBItest::spec_sql_quote_identifier Failure modes
#' @inheritSection DBItest::spec_sql_quote_identifier Specification
#'
#' @family DBIConnection generics
#' @export
#' @examples
#' # Quoting ensures that arbitrary input is safe for use in a query
#' name <- "Robert'); DROP TABLE Students;--"
#' dbQuoteIdentifier(ANSI(), name)
#'
#' # Use Id() to specify other components such as the schema
#' id_name <- Id(schema = "schema_name", table = "table_name")
#' id_name
#' dbQuoteIdentifier(ANSI(), id_name)
#'
#' # SQL vectors are always passed through as is
#' var_name <- SQL("select")
#' var_name
#' dbQuoteIdentifier(ANSI(), var_name)
#'
#' # This mechanism is used to prevent double escaping
#' dbQuoteIdentifier(ANSI(), dbQuoteIdentifier(ANSI(), name))
setGeneric("dbQuoteIdentifier",
  def = function(conn, x, ...) standardGeneric("dbQuoteIdentifier")
)

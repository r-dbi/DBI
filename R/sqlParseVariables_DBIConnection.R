#' @rdname hidden_aliases
#' @usage NULL
sqlParseVariables_DBIConnection <- function(conn, sql, ...) {
  sqlParseVariablesImpl(
    sql,
    list(
      sqlQuoteSpec('"', '"'),
      sqlQuoteSpec("'", "'")
    ),
    list(
      sqlCommentSpec("/*", "*/", TRUE),
      sqlCommentSpec("--", "\n", FALSE)
    )
  )
}
#' @rdname hidden_aliases
#' @export
setMethod("sqlParseVariables", signature("DBIConnection"), sqlParseVariables_DBIConnection)

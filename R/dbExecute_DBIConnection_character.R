#' @rdname hidden_aliases
#' @usage NULL
dbExecute_DBIConnection_character <- function(conn, statement, ...) {
  rs <- dbSendStatement(conn, statement, ...)
  on.exit(dbClearResult(rs))
  dbGetRowsAffected(rs)
}
#' @rdname hidden_aliases
#' @export
setMethod(
  "dbExecute",
  signature("DBIConnection", "character"),
  dbExecute_DBIConnection_character
)

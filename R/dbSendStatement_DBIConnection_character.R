#' @rdname hidden_aliases
#' @usage NULL
dbSendStatement_DBIConnection_character <- function(conn, statement, ...) {
  dbSendQuery(conn, statement, ...)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbSendStatement", signature("DBIConnection", "character"), dbSendStatement_DBIConnection_character)

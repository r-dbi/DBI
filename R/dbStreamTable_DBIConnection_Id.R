#' @rdname hidden_aliases
#' @usage NULL
dbStreamTable_DBIConnection_Id <- function(conn, name, ...) {
  dbStreamTable(conn, dbQuoteIdentifier(conn, name), ...)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbStreamTable", signature("DBIConnection", "Id"), dbStreamTable_DBIConnection_Id)

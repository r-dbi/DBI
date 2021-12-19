#' @rdname hidden_aliases
#' @usage NULL
dbWriteTable_DBIConnection_Id_ANY <- function(conn, name, value, ...) {
  dbWriteTable(conn, dbQuoteIdentifier(conn, name), value, ...)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbWriteTable", signature("DBIConnection", "Id", "ANY"), dbWriteTable_DBIConnection_Id_ANY)

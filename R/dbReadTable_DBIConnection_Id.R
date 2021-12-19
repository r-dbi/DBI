#' @rdname hidden_aliases
#' @usage NULL
dbReadTable_DBIConnection_Id <- function(conn, name, ...) {
  dbReadTable(conn, dbQuoteIdentifier(conn, name), ...)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbReadTable", signature("DBIConnection", "Id"), dbReadTable_DBIConnection_Id)

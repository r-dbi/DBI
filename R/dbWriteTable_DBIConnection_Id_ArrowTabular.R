#' @rdname hidden_aliases
#' @usage NULL
dbWriteTable_DBIConnection_Id_ArrowTabular <- function(conn, name, value, ...) {
  require_arrow()
  dbWriteTable(conn, dbQuoteIdentifier(conn, name), as.data.frame(value), ...)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbWriteTable", signature("DBIConnection", "Id", "ArrowTabular"), dbWriteTable_DBIConnection_Id_ArrowTabular)

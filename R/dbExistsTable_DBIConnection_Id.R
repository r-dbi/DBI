#' @rdname hidden_aliases
#' @usage NULL
dbExistsTable_DBIConnection_Id <- function(conn, name, ...) {
  dbExistsTable(conn, dbQuoteIdentifier(conn, name), ...)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbExistsTable", signature("DBIConnection", "Id"), dbExistsTable_DBIConnection_Id)

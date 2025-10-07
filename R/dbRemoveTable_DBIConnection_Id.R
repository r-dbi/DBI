#' @rdname hidden_aliases
#' @usage NULL
dbRemoveTable_DBIConnection_Id <- function(conn, name, ...) {
  dbRemoveTable(conn, dbQuoteIdentifier(conn, name), ...)
}
#' @rdname hidden_aliases
#' @export
setMethod(
  "dbRemoveTable",
  signature("DBIConnection", "Id"),
  dbRemoveTable_DBIConnection_Id
)

#' @rdname hidden_aliases
#' @usage NULL
dbReadTableArrow_DBIConnection_Id <- function(conn, name, ...) {
  dbReadTableArrow(conn, dbQuoteIdentifier(conn, name), ...)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbReadTableArrow", signature("DBIConnection", "Id"), dbReadTableArrow_DBIConnection_Id)

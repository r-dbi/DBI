#' @rdname hidden_aliases
#' @usage NULL
dbWriteStream_DBIConnection_Id_ANY <- function(conn, name, value, ...) {
  dbWriteStream(conn, dbQuoteIdentifier(conn, name), value, ...)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbWriteStream", signature("DBIConnection", "Id", "ANY"), dbWriteStream_DBIConnection_Id_ANY)

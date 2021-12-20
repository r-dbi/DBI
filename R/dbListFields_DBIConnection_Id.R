#' @rdname hidden_aliases
#' @usage NULL
dbListFields_DBIConnection_Id <- function(conn, name, ...) {
  list_fields(conn, name)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbListFields", signature("DBIConnection", "Id"), dbListFields_DBIConnection_Id)

#' @rdname hidden_aliases
#' @usage NULL
dbListFields_DBIConnection_character <- function(conn, name, ...) {
  list_fields(conn, name)
}
#' @rdname hidden_aliases
#' @export
setMethod(
  "dbListFields",
  signature("DBIConnection", "character"),
  dbListFields_DBIConnection_character
)

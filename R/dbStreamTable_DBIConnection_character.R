#' @rdname hidden_aliases
#' @usage NULL
dbStreamTable_DBIConnection_character <- function(conn, name, ...) {
  sql_name <- dbReadTable_toSqlName(conn, name, ...)
  dbGetStream(conn, paste0("SELECT * FROM ", sql_name))
}
#' @rdname hidden_aliases
#' @export
setMethod("dbStreamTable", signature("DBIConnection", "character"), dbStreamTable_DBIConnection_character)

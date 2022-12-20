#' @rdname hidden_aliases
#' @usage NULL
dbReadTableArrow_DBIConnection <- function(conn, name, ...) {
  sql_name <- dbReadTable_toSqlName(conn, name, ...)
  dbGetQueryArrow(conn, paste0("SELECT * FROM ", sql_name))
}
#' @rdname hidden_aliases
#' @export
setMethod("dbReadTableArrow", signature("DBIConnection"), dbReadTableArrow_DBIConnection)

#' @rdname hidden_aliases
#' @usage NULL
dbWriteTable_DBIConnection_character_ArrowTabular <- function(conn, name, value, ...) {
  require_arrow()
  dbWriteTable(conn, name, as.data.frame(value), ...)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbWriteTable", signature("DBIConnection", "character", "ArrowTabular"), dbWriteTable_DBIConnection_character_ArrowTabular)

#' @rdname hidden_aliases
#' @usage NULL
dbReadTableArrow_DBIConnection_character <- function(conn, name, ...) {
  res <- dbReadTable(conn, name, ...)
  arrow::as_arrow_table(res)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbReadTableArrow", signature("DBIConnection", "character"), dbReadTableArrow_DBIConnection_character)

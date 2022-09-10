#' @rdname hidden_aliases
#' @usage NULL
dbWriteStream_DBIConnection_character_ArrowTabular <- function(conn, name, value, ...) {
  dbWriteStream(conn, name, arrow::as_record_batch_reader(value), ...)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbWriteStream", signature("DBIConnection", "character", "ArrowTabular"), dbWriteStream_DBIConnection_character_ArrowTabular)

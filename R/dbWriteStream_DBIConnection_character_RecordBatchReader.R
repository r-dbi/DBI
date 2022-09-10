#' @rdname hidden_aliases
#' @usage NULL
dbWriteStream_DBIConnection_character_RecordBatchReader <- function(conn, name, value, append = TRUE, overwrite = FALSE, ...) {
  require_arrow()

  if (overwrite && append) {
    stop("overwrite and append cannot both be TRUE")
  }

  if (overwrite || !append) {
    dbWriteTable(conn, name, as.data.frame(value$read_next_batch()), ...)
  }

  while(TRUE) {
    tmp <- value$read_next_batch()
    if (is.null(tmp)) {
      break
    }
    dbAppendTable(conn, name, as.data.frame(tmp), ...)
  }

  TRUE
}
#' @rdname hidden_aliases
#' @export
setMethod("dbWriteStream", signature("DBIConnection", "character", "RecordBatchReader"), dbWriteStream_DBIConnection_character_RecordBatchReader)

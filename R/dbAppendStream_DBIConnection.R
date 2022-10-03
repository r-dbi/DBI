#' @rdname hidden_aliases
#' @usage NULL
dbAppendStream_DBIConnection <- function(conn, name, value, ...) {
  require_arrow()

  name <- dbQuoteIdentifier(conn, name)

  value <- arrow::as_record_batch_reader(value)

  while (TRUE) {
    # Append next batch (starting with the first or second, doesn't matter)
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
setMethod("dbAppendStream", signature("DBIConnection"), dbAppendStream_DBIConnection)

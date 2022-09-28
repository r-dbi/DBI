#' @rdname hidden_aliases
#' @usage NULL
dbWriteStream_DBIConnection <- function(conn, name, value, append = FALSE, overwrite = FALSE, ...) {
  require_arrow()

  name <- dbQuoteIdentifier(conn, name)

  value <- arrow::as_record_batch_reader(value)

  if (overwrite && append) {
    stop("overwrite and append cannot both be TRUE")
  }

  if (overwrite || !append) {
    # Create table *and* append first batch if needed
    dbWriteTable(conn, name, as.data.frame(value$read_next_batch()), ..., append = append, overwrite = overwrite)
  }

  while(TRUE) {
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
setMethod("dbWriteStream", signature("DBIConnection"), dbWriteStream_DBIConnection)

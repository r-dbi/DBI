#' @rdname hidden_aliases
#' @usage NULL
dbWriteStream_DBIConnection <- function(conn, name, value, append = FALSE, overwrite = FALSE, ..., temporary = FALSE) {
  require_arrow()

  name <- dbQuoteIdentifier(conn, name)

  value <- arrow::as_record_batch_reader(value)

  if (overwrite && append) {
    stop("overwrite and append cannot both be TRUE")
  }

  if (overwrite && dbExistsTable(conn, name)) {
    dbRemoveTable(conn, name)
  }

  if (overwrite || !append) {
    dbCreateFromStream(conn, name, value, temporary = temporary)
  }

  dbAppendStream(conn, name, value)

  TRUE
}
#' @rdname hidden_aliases
#' @export
setMethod("dbWriteStream", signature("DBIConnection"), dbWriteStream_DBIConnection)

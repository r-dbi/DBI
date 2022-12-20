#' @rdname hidden_aliases
#' @usage NULL
dbWriteTableArrow_DBIConnection <- function(conn, name, value, append = FALSE, overwrite = FALSE, ..., temporary = FALSE) {
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
    dbCreateTableArrow(conn, name, value, temporary = temporary)
  }

  dbAppendTableArrow(conn, name, value)

  invisible(TRUE)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbWriteTableArrow", signature("DBIConnection"), dbWriteTableArrow_DBIConnection)

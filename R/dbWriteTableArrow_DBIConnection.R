#' @rdname hidden_aliases
#' @usage NULL
dbWriteTableArrow_DBIConnection <- function(conn, name, value, append = FALSE, overwrite = FALSE, ..., temporary = FALSE) {
  require_arrow()

  stopifnot(is.logical(append))
  stopifnot(length(append) == 1)
  stopifnot(!is.na(append))
  stopifnot(is.logical(overwrite))
  stopifnot(length(overwrite) == 1)
  stopifnot(!is.na(overwrite))
  stopifnot(is.logical(temporary))
  stopifnot(length(temporary) == 1)
  stopifnot(!is.na(temporary))

  name <- dbQuoteIdentifier(conn, name)

  value <- nanoarrow::as_nanoarrow_array_stream(value)

  if (overwrite && append) {
    stop("overwrite and append cannot both be TRUE")
  }

  exists <- dbExistsTable(conn, name)
  if (overwrite && exists) {
    dbRemoveTable(conn, name)
  }

  if (overwrite || !append || !exists) {
    dbCreateTableArrow(conn, name, value, temporary = temporary)
  }

  dbAppendTableArrow(conn, name, value)

  invisible(TRUE)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbWriteTableArrow", signature("DBIConnection"), dbWriteTableArrow_DBIConnection)

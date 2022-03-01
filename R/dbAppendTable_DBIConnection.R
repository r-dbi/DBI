#' @rdname hidden_aliases
#' @usage NULL
dbAppendTable_DBIConnection <- function(conn, name, value, ..., row.names = NULL) {
  if (!is.null(row.names)) {
    stop("Can't pass `row.names` to `dbAppendTable()`", call. = FALSE)
  }
  stopifnot(is.data.frame(value))

  query <- sqlAppendTableTemplate(
    con = conn,
    table = name,
    values = value,
    row.names = row.names,
    prefix = "?",
    pattern = "",
    ...
  )
  dbExecute(conn, query, params = unname(as.list(value)))
}
#' @rdname hidden_aliases
#' @export
setMethod("dbAppendTable", signature("DBIConnection"), dbAppendTable_DBIConnection)

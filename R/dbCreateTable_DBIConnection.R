#' @rdname hidden_aliases
#' @usage NULL
dbCreateTable_DBIConnection <- function(conn, name, fields, ..., row.names = NULL, temporary = FALSE) {
  stopifnot(is.null(row.names))
  stopifnot(is.logical(temporary), length(temporary) == 1L)

  query <- sqlCreateTable(
    con = conn,
    table = name,
    fields = fields,
    row.names = row.names,
    temporary = temporary,
    ...
  )
  dbExecute(conn, query)
  invisible(TRUE)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbCreateTable", signature("DBIConnection"), dbCreateTable_DBIConnection)

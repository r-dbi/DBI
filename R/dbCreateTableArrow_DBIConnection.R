#' @rdname hidden_aliases
#' @usage NULL
dbCreateTableArrow_DBIConnection <- function(conn, name, value, ..., temporary = FALSE) {
  require_arrow()

  value <- nanoarrow::as_nanoarrow_array_stream(value)

  ptype <- get_query_arrow_ptype(value)
  dbCreateTable(conn, name, ptype, ..., temporary = temporary)
}

get_query_arrow_ptype <- function(value) {
  schema <- value$get_schema()
  stopifnot(!is.null(schema))

  nanoarrow::infer_nanoarrow_ptype(schema)
}

#' @rdname hidden_aliases
#' @export
setMethod("dbCreateTableArrow", signature("DBIConnection"), dbCreateTableArrow_DBIConnection)

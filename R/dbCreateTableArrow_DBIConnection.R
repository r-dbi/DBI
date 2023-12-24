#' @rdname hidden_aliases
#' @usage NULL
dbCreateTableArrow_DBIConnection <- function(conn, name, value, ..., temporary = FALSE) {
  require_arrow()

  ptype <- nanoarrow::infer_nanoarrow_ptype(value)
  dbCreateTable(conn, name, ptype, ..., temporary = temporary)
}

#' @rdname hidden_aliases
#' @export
setMethod("dbCreateTableArrow", signature("DBIConnection"), dbCreateTableArrow_DBIConnection)

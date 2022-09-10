#' @rdname hidden_aliases
#' @usage NULL
dbStreamTable_DBIConnection_character <- function(conn, name, ..., row.names = FALSE) {
  sql_name <- dbReadTable_toSqlName(conn, name, ...)
  if (!is.null(row.names)) {
    # row names might be supportable in schema metadata, however currently do not survive table/df round-trip
    stopifnot(identical(row.names, FALSE))
  }
  dbGetStream(conn, paste0("SELECT * FROM ", sql_name))
}
#' @rdname hidden_aliases
#' @export
setMethod("dbStreamTable", signature("DBIConnection", "character"), dbStreamTable_DBIConnection_character)

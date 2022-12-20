#' @rdname hidden_aliases
#' @usage NULL
dbGetStream_DBIConnection_character <- function(conn, statement, ...) {
  rs <- dbSendQueryStream(conn, statement, ...)
  on.exit(dbClearResult(rs))

  dbStream(rs, ...)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbGetStream", signature("DBIConnection"), dbGetStream_DBIConnection_character)

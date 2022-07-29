#' @rdname hidden_aliases
#' @usage NULL
dbGetQueryArrow_DBIConnection_character <- function(conn, statement, ...) {
  rs <- dbSendQueryArrow(conn, statement, ...)
  on.exit(dbClearResult(rs))

  dbStream(rs, ...)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbGetQueryArrow", signature("DBIConnection", "character"), dbGetQueryArrow_DBIConnection_character)

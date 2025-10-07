#' @rdname hidden_aliases
#' @usage NULL
dbGetQueryArrow_DBIConnection_character <- function(conn, statement, ...) {
  rs <- dbSendQueryArrow(conn, statement, ...)
  on.exit(dbClearResult(rs))

  dbFetchArrow(rs, ...)
}
#' @rdname hidden_aliases
#' @export
setMethod(
  "dbGetQueryArrow",
  signature("DBIConnection"),
  dbGetQueryArrow_DBIConnection_character
)

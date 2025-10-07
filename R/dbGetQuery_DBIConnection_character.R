#' @rdname hidden_aliases
#' @param n Number of rows to fetch, default -1
#' @usage NULL
dbGetQuery_DBIConnection_character <- function(conn, statement, ..., n = -1L) {
  rs <- dbSendQuery(conn, statement, ...)
  on.exit(dbClearResult(rs))

  dbFetch(rs, n = n, ...)
}
#' @rdname hidden_aliases
#' @export
setMethod(
  "dbGetQuery",
  signature("DBIConnection", "character"),
  dbGetQuery_DBIConnection_character
)

#' @rdname hidden_aliases
#' @usage NULL
dbSendQueryStream_DBIConnection <- function(conn, statement, ...) {
  new(
    "DBIResultStreamDefault",
    result = dbSendQuery(conn, statement, ...)
  )
}
#' @rdname hidden_aliases
#' @export
setMethod("dbSendQueryStream", signature("DBIConnection"), dbSendQueryStream_DBIConnection)

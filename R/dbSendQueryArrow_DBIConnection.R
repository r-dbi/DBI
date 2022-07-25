#' @rdname hidden_aliases
#' @usage NULL
dbSendQueryArrow_DBIConnection <- function(conn, statement, ...) {
  new(
    "DBIArrowResult",
    result = dbSendQuery(conn, statement, ...)
  )
}
#' @rdname hidden_aliases
#' @export
setMethod("dbSendQueryArrow", signature("DBIConnection"), dbSendQueryArrow_DBIConnection)

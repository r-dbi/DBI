#' @rdname hidden_aliases
#' @usage NULL
dbSendQueryArrow_DBIConnection <- function(conn, statement, params = NULL, ...) {
  result <- dbSendQuery(conn, statement, params = params, ...)

  new("DBIResultArrowDefault", result = result)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbSendQueryArrow", signature("DBIConnection"), dbSendQueryArrow_DBIConnection)

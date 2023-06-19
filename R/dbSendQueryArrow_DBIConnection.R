#' @rdname hidden_aliases
#' @usage NULL
dbSendQueryArrow_DBIConnection <- function(conn, statement, params = NULL, ...) {
  if (!is.null(params)) {
    params <- as.data.frame(params)
  }

  new(
    "DBIResultArrowDefault",
    result = dbSendQuery(conn, statement, params = params, ...)
  )
}
#' @rdname hidden_aliases
#' @export
setMethod("dbSendQueryArrow", signature("DBIConnection"), dbSendQueryArrow_DBIConnection)

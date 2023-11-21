#' @rdname hidden_aliases
#' @usage NULL
dbSendQueryArrow_DBIConnection <- function(conn, statement, params = NULL, ...) {
  if (!is.null(params)) {
    params <- as.data.frame(params)
  }

  result <- dbSendQuery(conn, statement, params = params, ...)

  new("DBIResultArrowDefault", result = result)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbSendQueryArrow", signature("DBIConnection"), dbSendQueryArrow_DBIConnection)

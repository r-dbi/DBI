#' @rdname hidden_aliases
#' @usage NULL
dbBindArrow_DBIResultArrowDefault <- function(res, params, ...) {
  dbBind(res@result, params = param_stream_to_list(params), ...)
  invisible(res)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbBindArrow", signature("DBIResultArrowDefault"), dbBindArrow_DBIResultArrowDefault)

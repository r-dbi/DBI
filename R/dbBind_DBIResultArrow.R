#' @rdname hidden_aliases
#' @usage NULL
dbBind_DBIResultArrow <- function(res, params, ...) {
  dbBind(res@result, params = params, ...)
  invisible(res)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbBind", signature("DBIResultArrow"), dbBind_DBIResultArrow)

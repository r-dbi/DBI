#' @rdname hidden_aliases
#' @usage NULL
dbBind_DBIArrowResult <- function(res, params, ...) {
  dbBind(res@result, params = params, ...)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbBind", signature("DBIResultArrow"), dbBind_DBIArrowResult)

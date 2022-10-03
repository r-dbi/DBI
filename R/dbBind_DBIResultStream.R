#' @rdname hidden_aliases
#' @usage NULL
dbBind_DBIResultStream <- function(res, params, ...) {
  dbBind(res@result, params = params, ...)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbBind", signature("DBIResultStream"), dbBind_DBIResultStream)

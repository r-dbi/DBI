#' @rdname hidden_aliases
#' @usage NULL
dbGetStatement_DBIArrowResult <- function(res, ...) {
  dbGetStatement(res@result, ...)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbGetStatement", signature("DBIResultArrow"), dbGetStatement_DBIArrowResult)

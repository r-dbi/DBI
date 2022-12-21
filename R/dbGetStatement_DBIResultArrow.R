#' @rdname hidden_aliases
#' @usage NULL
dbGetStatement_DBIResultArrow <- function(res, ...) {
  dbGetStatement(res@result, ...)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbGetStatement", signature("DBIResultArrow"), dbGetStatement_DBIResultArrow)

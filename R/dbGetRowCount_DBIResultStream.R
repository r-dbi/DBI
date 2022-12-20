#' @rdname hidden_aliases
#' @usage NULL
dbGetRowCount_DBIResultArrow <- function(res, ...) {
  dbGetRowCount(res@result, ...)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbGetRowCount", signature("DBIResultArrow"), dbGetRowCount_DBIResultArrow)

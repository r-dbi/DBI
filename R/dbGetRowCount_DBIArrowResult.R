#' @rdname hidden_aliases
#' @usage NULL
dbGetRowCount_DBIArrowResult <- function(res, ...) {
  dbGetRowCount(res@result, ...)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbGetRowCount", signature("DBIResultArrow"), dbGetRowCount_DBIArrowResult)

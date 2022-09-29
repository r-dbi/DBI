#' @rdname hidden_aliases
#' @usage NULL
dbHasCompleted_DBIArrowResult <- function(res, ...) {
  dbHasCompleted(res@result, ...)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbHasCompleted", signature("DBIResultArrow"), dbHasCompleted_DBIArrowResult)

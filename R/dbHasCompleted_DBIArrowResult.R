#' @rdname hidden_aliases
#' @usage NULL
dbHasCompleted_DBIArrowResult <- function(res, ...) {
  dbHasCompleted(res@result, ...)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbHasCompleted", signature("DBIArrowResult"), dbHasCompleted_DBIArrowResult)

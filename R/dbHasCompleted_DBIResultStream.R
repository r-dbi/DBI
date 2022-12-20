#' @rdname hidden_aliases
#' @usage NULL
dbHasCompleted_DBIResultStream <- function(res, ...) {
  dbHasCompleted(res@result, ...)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbHasCompleted", signature("DBIResultStream"), dbHasCompleted_DBIResultStream)

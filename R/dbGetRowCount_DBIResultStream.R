#' @rdname hidden_aliases
#' @usage NULL
dbGetRowCount_DBIResultStream <- function(res, ...) {
  dbGetRowCount(res@result, ...)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbGetRowCount", signature("DBIResultStream"), dbGetRowCount_DBIResultStream)

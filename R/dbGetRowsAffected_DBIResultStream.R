#' @rdname hidden_aliases
#' @usage NULL
dbGetRowsAffected_DBIResultStream <- function(res, ...) {
  dbGetRowsAffected(res@result, ...)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbGetRowsAffected", signature("DBIResultStream"), dbGetRowsAffected_DBIResultStream)

#' @rdname hidden_aliases
#' @usage NULL
dbGetStatement_DBIResultStream <- function(res, ...) {
  dbGetStatement(res@result, ...)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbGetStatement", signature("DBIResultStream"), dbGetStatement_DBIResultStream)

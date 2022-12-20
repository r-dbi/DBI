#' @rdname hidden_aliases
#' @usage NULL
dbClearResult_DBIResultStream <- function(res, ...) {
  dbClearResult(res@result, ...)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbClearResult", signature("DBIResultStream"), dbClearResult_DBIResultStream)

#' @rdname hidden_aliases
#' @usage NULL
dbClearResult_DBIArrowResult <- function(res, ...) {
  dbClearResult(res@result, ...)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbClearResult", signature("DBIArrowResult"), dbClearResult_DBIArrowResult)

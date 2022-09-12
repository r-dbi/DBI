#' @rdname hidden_aliases
#' @usage NULL
dbGetRowsAffected_DBIArrowResult <- function(res, ...) {
  dbGetRowsAffected(res@result, ...)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbGetRowsAffected", signature("DBIResultArrow"), dbGetRowsAffected_DBIArrowResult)

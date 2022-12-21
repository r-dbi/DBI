#' @rdname hidden_aliases
#' @usage NULL
dbGetRowsAffected_DBIResultArrow <- function(res, ...) {
  dbGetRowsAffected(res@result, ...)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbGetRowsAffected", signature("DBIResultArrow"), dbGetRowsAffected_DBIResultArrow)

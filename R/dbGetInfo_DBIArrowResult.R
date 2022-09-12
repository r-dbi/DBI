#' @rdname hidden_aliases
#' @usage NULL
dbGetInfo_DBIArrowResult <- function(dbObj, ...) {
  dbGetInfo(dbObj@result, ...)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbGetInfo", signature("DBIResultArrow"), dbGetInfo_DBIArrowResult)

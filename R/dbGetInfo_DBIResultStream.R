#' @rdname hidden_aliases
#' @usage NULL
dbGetInfo_DBIResultStream <- function(dbObj, ...) {
  dbGetInfo(dbObj@result, ...)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbGetInfo", signature("DBIResultStream"), dbGetInfo_DBIResultStream)

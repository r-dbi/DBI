#' @rdname hidden_aliases
#' @usage NULL
dbDataType_DBIConnector <- function(dbObj, obj, ...) {
  dbDataType(dbObj@.drv, obj, ...)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbDataType", signature("DBIConnector"), dbDataType_DBIConnector)

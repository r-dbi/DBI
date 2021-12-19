#' @rdname hidden_aliases
#' @usage NULL
dbDataType_DBIObject <- function(dbObj, obj, ...) {
  dbiDataType(obj)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbDataType", signature("DBIObject"), dbDataType_DBIObject)

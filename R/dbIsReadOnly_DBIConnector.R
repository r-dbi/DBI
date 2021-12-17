#' @rdname hidden_aliases
#' @usage NULL
dbIsReadOnly_DBIConnector <- function(dbObj, ...) {
  dbIsReadOnly(dbObj@.drv, ...)
}
#' @rdname hidden_aliases
setMethod("dbIsReadOnly", signature("DBIConnector"), dbIsReadOnly_DBIConnector)

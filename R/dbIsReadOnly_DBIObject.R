#' @rdname hidden_aliases
#' @usage NULL
dbIsReadOnly_DBIObject <- function(dbObj, ...) {
  FALSE
}
#' @rdname hidden_aliases
setMethod("dbIsReadOnly", "DBIObject", dbIsReadOnly_DBIObject)

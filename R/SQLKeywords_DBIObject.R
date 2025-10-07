#' @rdname hidden_aliases
#' @usage NULL
SQLKeywords_DBIObject <- function(dbObj, ...) .SQL92Keywords
#' @rdname hidden_aliases
setMethod(
  "SQLKeywords",
  signature("DBIObject"),
  SQLKeywords_DBIObject,
  valueClass = "character"
)

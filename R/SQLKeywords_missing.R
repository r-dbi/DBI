#' @rdname hidden_aliases
#' @usage NULL
SQLKeywords_missing <- function(dbObj, ...) .SQL92Keywords
#' @rdname hidden_aliases
setMethod(
  "SQLKeywords",
  signature("missing"),
  SQLKeywords_missing,
  valueClass = "character"
)

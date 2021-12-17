#' @rdname hidden_aliases
#' @usage NULL
isSQLKeyword_DBIObject_character <- function(dbObj, name, keywords, case, ...)
  isSQLKeyword.default(name, keywords, case)
#' @rdname hidden_aliases
setMethod("isSQLKeyword", signature(dbObj = "DBIObject", name = "character"), isSQLKeyword_DBIObject_character, valueClass = "logical")

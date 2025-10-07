#' @rdname hidden_aliases
#' @usage NULL
make.db.names_DBIObject_character <- function(
  dbObj,
  snames,
  keywords,
  unique,
  allow.keywords,
  ...
) {
  make.db.names.default(snames, keywords, unique, allow.keywords)
}
#' @rdname hidden_aliases
setMethod(
  "make.db.names",
  signature(dbObj = "DBIObject", snames = "character"),
  make.db.names_DBIObject_character,
  valueClass = "character"
)

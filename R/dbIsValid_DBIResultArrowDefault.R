#' @rdname hidden_aliases
#' @usage NULL
dbIsValid_DBIResultArrowDefault <- function(dbObj, ...) {
  dbIsValid(dbObj@result)
}
#' @rdname hidden_aliases
#' @export
setMethod(
  "dbIsValid",
  signature("DBIResultArrowDefault"),
  dbIsValid_DBIResultArrowDefault
)

#' @rdname hidden_aliases
#' @usage NULL
dbHasCompleted_DBIResultArrow <- function(res, ...) {
  dbHasCompleted(res@result, ...)
}
#' @rdname hidden_aliases
#' @export
setMethod(
  "dbHasCompleted",
  signature("DBIResultArrow"),
  dbHasCompleted_DBIResultArrow
)

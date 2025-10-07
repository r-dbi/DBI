#' @rdname hidden_aliases
#' @usage NULL
dbClearResult_DBIResultArrow <- function(res, ...) {
  dbClearResult(res@result, ...)
}
#' @rdname hidden_aliases
#' @export
setMethod(
  "dbClearResult",
  signature("DBIResultArrow"),
  dbClearResult_DBIResultArrow
)

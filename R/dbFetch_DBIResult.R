#' @rdname hidden_aliases
#' @usage NULL
dbFetch_DBIResult <- function(res, n = -1, ...) {
  fetch(res, n = n, ...)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbFetch", signature("DBIResult"), dbFetch_DBIResult)

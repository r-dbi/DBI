#' @rdname hidden_aliases
#' @usage NULL
dbFetchArrow_DBIResult <- function(res, n = -1, ...) {
  out <- dbFetch(res, n = n, ...)
  arrow::as_arrow_table(out)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbFetchArrow", signature("DBIResult"), dbFetchArrow_DBIResult)

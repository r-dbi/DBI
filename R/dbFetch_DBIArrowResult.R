#' @rdname hidden_aliases
#' @usage NULL
dbFetch_DBIArrowResult <- function(res, n = -1, ...) {

  if (is.infinite(n)) {
    n <- -1
  }

  if (n != -1) {
    stop("Cannot dbFetch() an Arrow result unless n = -1")
  }

  out <- dbFetch(res@result, n = -1, ...)
  arrow::as_arrow_table(out)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbFetch", signature("DBIArrowResult"), dbFetch_DBIArrowResult)

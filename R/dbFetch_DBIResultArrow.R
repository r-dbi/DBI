#' @rdname hidden_aliases
#' @usage NULL
dbFetch_DBIResultArrow <- function(res, n = -1, ...) {

  if (is.infinite(n)) {
    n <- -1
  }

  if (n != -1) {
    stop("Cannot dbFetch() an Arrow result unless n = -1")
  }

  as.data.frame(
    dbStream(res, ...)
  )
}
#' @rdname hidden_aliases
#' @export
setMethod("dbFetch", signature("DBIArrowResult"), dbFetch_DBIResultArrow)

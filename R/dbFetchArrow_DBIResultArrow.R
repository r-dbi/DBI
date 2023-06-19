#' @rdname hidden_aliases
#' @usage NULL
dbFetchArrow_DBIResultArrow <- function(res, ...) {
  nanoarrow::as_nanoarrow_array_stream(
    dbFetch(res@result, n = -1, ...)
  )
}
#' @rdname hidden_aliases
#' @export
setMethod("dbFetchArrow", signature("DBIResultArrow"), dbFetchArrow_DBIResultArrow)

#' @rdname hidden_aliases
#' @usage NULL
dbFetchArrowChunk_DBIResultArrow <- function(res, ...) {
  nanoarrow::as_nanoarrow_array(
    dbFetch(res@result, n = 256, ...)
  )
}
#' @rdname hidden_aliases
#' @export
setMethod("dbFetchArrowChunk", signature("DBIResultArrow"), dbFetchArrowChunk_DBIResultArrow)

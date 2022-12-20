#' @rdname hidden_aliases
#' @usage NULL
dbFetchArrow_DBIResultArrow <- function(res, ...) {
  arrow::as_record_batch_reader(
    dbFetch(res@result, n = -1, ...)
  )
}
#' @rdname hidden_aliases
#' @export
setMethod("dbFetchArrow", signature("DBIResultArrow"), dbFetchArrow_DBIResultArrow)

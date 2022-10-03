#' @rdname hidden_aliases
#' @usage NULL
dbStream_DBIResultStream <- function(res, ...) {
  arrow::as_record_batch_reader(
    dbFetch(res@result, n = -1, ...)
  )
}
#' @rdname hidden_aliases
#' @export
setMethod("dbStream", signature("DBIResultStream"), dbStream_DBIResultStream)

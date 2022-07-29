#' @rdname dbFetch
#' @export
setGeneric("dbStream",
  def = function(res, ...) standardGeneric("dbStream"),
  valueClass = "RecordBatchReader"
)

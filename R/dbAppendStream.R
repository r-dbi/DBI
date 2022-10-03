#' @name dbWriteTable
#' @aliases dbAppendStream
#' @export
setGeneric("dbAppendStream",
  def = function(conn, name, value, ...) standardGeneric("dbAppendStream")
)

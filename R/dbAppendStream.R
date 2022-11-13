#' @include dbAppendTable.R
#' @name dbAppendTable
#' @aliases dbAppendStream
#' @export
setGeneric("dbAppendStream",
  def = function(conn, name, value, ...) standardGeneric("dbAppendStream")
)

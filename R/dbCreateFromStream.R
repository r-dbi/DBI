#' @include dbCreateTable.R
#' @name dbCreateTable
#' @aliases dbCreateFromStream
#' @param value An object coercible to an Arrow RecordBatchReader.
#' @export
setGeneric("dbCreateFromStream",
  def = function(conn, name, value, ...) standardGeneric("dbCreateFromStream")
)

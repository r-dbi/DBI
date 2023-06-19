#' @name dbCreateTable
#' @aliases dbCreateTableArrow
#' @param value An object coercible to an Arrow RecordBatchReader.
#' @export
setGeneric("dbCreateTableArrow",
  def = function(conn, name, value, ...) standardGeneric("dbCreateTableArrow")
)

#' @name dbWriteTable
#' @aliases dbCreateFromStream
#' @export
setGeneric("dbCreateFromStream",
  def = function(conn, name, value, ...) standardGeneric("dbCreateFromStream")
)

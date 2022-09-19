#' @name dbWriteTable
#' @aliases dbWriteStream
#' @export
setGeneric("dbWriteStream",
  def = function(conn, name, value, ...) standardGeneric("dbWriteStream")
)

#' @rdname dbWriteTable
#' @export
setGeneric("dbWriteStream",
  def = function(conn, name, value, ...) standardGeneric("dbWriteStream")
)

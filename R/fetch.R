#' @rdname dbFetch
#' @export
setGeneric("fetch",
  def = function(res, n = -1, ...) standardGeneric("fetch"),
  valueClass = "data.frame"
)

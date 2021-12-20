#' @usage NULL
dbiDataType_integer <- function(x) "INT"

setMethod("dbiDataType", signature("integer"), dbiDataType_integer)

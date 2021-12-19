#' @usage NULL
dbiDataType_numeric <- function(x) "DOUBLE"

setMethod("dbiDataType", signature("numeric"), dbiDataType_numeric)

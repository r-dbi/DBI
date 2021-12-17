#' @usage NULL
dbiDataType_POSIXct <- function(x) "TIMESTAMP"

setMethod("dbiDataType", signature("POSIXct"), dbiDataType_POSIXct)

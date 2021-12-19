#' @usage NULL
dbiDataType_difftime <- function(x) "TIME"

setMethod("dbiDataType", signature("difftime"), dbiDataType_difftime)

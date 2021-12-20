#' @usage NULL
dbiDataType_logical <- function(x) "SMALLINT"

setMethod("dbiDataType", signature("logical"), dbiDataType_logical)

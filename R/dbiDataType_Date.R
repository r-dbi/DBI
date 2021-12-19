#' @usage NULL
dbiDataType_Date <- function(x) "DATE"

setMethod("dbiDataType", signature("Date"), dbiDataType_Date)

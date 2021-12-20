dbiDataType_data.frame <- function(x) {
  vapply(x, dbiDataType, FUN.VALUE = character(1), USE.NAMES = TRUE)
}

setMethod("dbiDataType", signature("data.frame"), dbiDataType_data.frame)

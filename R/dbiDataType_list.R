dbiDataType_list <- function(x) {
  is_raw <- vapply(x, is.raw, logical(1))
  if (!all(is_raw)) {
    stop("Only lists of raw vectors are currently supported", call. = FALSE)
  }
  "BLOB"
}

setMethod("dbiDataType", signature("list"), dbiDataType_list)

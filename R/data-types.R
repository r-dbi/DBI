#' @include dbiDataType.R

varchar_data_type <- function(x) {
  "TEXT"
}

list_data_type <- function(x) {
  check_raw_list(x)
  "BLOB"
}

check_raw_list <- function(x) {
  is_raw <- vapply(x, is.raw, logical(1))
  if (!all(is_raw)) {
    stop("Only lists of raw vectors are currently supported", call. = FALSE)
  }
}

as_is_data_type <- function(x) {
  oldClass(x) <- oldClass(x)[-1]
  dbiDataType(x)
}

setOldClass("difftime")

setOldClass("AsIs")

setMethod("dbiDataType", signature("character"),  varchar_data_type)

setMethod("dbiDataType", signature("factor"),     varchar_data_type)

setMethod("dbiDataType", signature("list"),       list_data_type)

setMethod("dbiDataType", signature("AsIs"),       as_is_data_type)


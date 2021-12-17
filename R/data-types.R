#' @include dbiDataType.R

as_is_data_type <- function(x) {
  oldClass(x) <- oldClass(x)[-1]
  dbiDataType(x)
}

setOldClass("difftime")

setOldClass("AsIs")


setMethod("dbiDataType", signature("AsIs"),       as_is_data_type)


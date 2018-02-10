setGeneric("dbiDataType",
  def = function(x, ...) standardGeneric("dbiDataType")
)

data_frame_data_type <- function(x) {
  vapply(x, dbiDataType, FUN.VALUE = character(1), USE.NAMES = TRUE)
}

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

setMethod("dbiDataType", signature("data.frame"), data_frame_data_type)
setMethod("dbiDataType", signature("integer"),    function(x) "INT")
setMethod("dbiDataType", signature("numeric"),    function(x) "DOUBLE")
setMethod("dbiDataType", signature("logical"),    function(x) "SMALLINT")
setMethod("dbiDataType", signature("Date"),       function(x) "DATE")
setMethod("dbiDataType", signature("difftime"),   function(x) "TIME")
setMethod("dbiDataType", signature("POSIXct"),    function(x) "TIMESTAMP")
setMethod("dbiDataType", signature("character"),  varchar_data_type)
setMethod("dbiDataType", signature("factor"),     varchar_data_type)
setMethod("dbiDataType", signature("list"),       list_data_type)
setMethod("dbiDataType", signature("AsIs"),       as_is_data_type)

setGeneric("dbiDataType", function(x) standardGeneric("dbiDataType"))

data_frame_data_type <- function(x) {
  vapply(x, dbiDataType, FUN.VALUE = character(1), USE.NAMES = TRUE)
}

varchar_data_type <- function(x) {
  paste0("VARCHAR(", max(nchar(as.character(x))), ")")
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
  dbiDataType(unclass(x))
}

setOldClass("difftime")
setOldClass("AsIs")

setMethod("dbiDataType", "data.frame", data_frame_data_type)
setMethod("dbiDataType", "integer",    function(x) "INT")
setMethod("dbiDataType", "numeric",    function(x) "DOUBLE")
setMethod("dbiDataType", "logical",    function(x) "SMALLINT")
setMethod("dbiDataType", "Date",       function(x) "DATE")
setMethod("dbiDataType", "difftime",   function(x) "TIME")
setMethod("dbiDataType", "POSIXct",    function(x) "TIMESTAMP")
setMethod("dbiDataType", "character",  varchar_data_type)
setMethod("dbiDataType", "factor",     varchar_data_type)
setMethod("dbiDataType", "list",       list_data_type)
setMethod("dbiDataType", "AsIs",       as_is_data_type)

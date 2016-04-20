setGeneric("dbiDataType", function(x) standardGeneric("dbiDataType"))

data_frame_data_type <- function(x) {
  vapply(x, dbiDataType, FUN.VALUE = character(1), USE.NAMES = TRUE)
}

varchar_data_type <- function(x) {
  paste0("varchar(", max(nchar(as.character(x))), ")")
}

list_data_type <- function(x) {
  check_raw_list(x)
  "blob"
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
setMethod("dbiDataType", "integer",    function(x) "int")
setMethod("dbiDataType", "numeric",    function(x) "double")
setMethod("dbiDataType", "logical",    function(x) "smallint")
setMethod("dbiDataType", "Date",       function(x) "date")
setMethod("dbiDataType", "difftime",   function(x) "time")
setMethod("dbiDataType", "POSIXct",    function(x) "timestamp")
setMethod("dbiDataType", "character",  varchar_data_type)
setMethod("dbiDataType", "factor",     varchar_data_type)
setMethod("dbiDataType", "list",       list_data_type)
setMethod("dbiDataType", "AsIs",       as_is_data_type)

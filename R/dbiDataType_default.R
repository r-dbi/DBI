dbiDataType_default <- function(x) {
  if (inherits(x, c("blob", "arrow_binary"))) {
    return("BLOB")
  }
  stop("SQL type unknown for objects of class ", paste(class(x), collapse = "/"))
}

setMethod("dbiDataType", signature("ANY"), dbiDataType_default)

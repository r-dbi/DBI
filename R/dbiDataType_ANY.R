dbiDataType_ANY <- function(x) {
  if (inherits(x, "blob")) {
    return("BLOB")
  }
  stop(
    "Unknown SQL data type for object of class ",
    paste(class(x), collapse = "/")
  )
}

setMethod("dbiDataType", signature("ANY"), dbiDataType_ANY)

dbiDataType_AsIs <- function(x) {
  oldClass(x) <- oldClass(x)[-1]
  dbiDataType(x)
}

setMethod("dbiDataType", signature("AsIs"), dbiDataType_AsIs)

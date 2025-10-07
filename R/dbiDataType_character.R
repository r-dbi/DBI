dbiDataType_character <- function(x) {
  "TEXT"
}

setMethod("dbiDataType", signature("character"), dbiDataType_character)

setMethod("dbiDataType", signature("factor"), dbiDataType_character)

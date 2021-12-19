#' @rdname hidden_aliases
#' @usage NULL
dbDriver_character <- function(drvName, ...) {
  findDriver(drvName)(...)
}
#' @rdname hidden_aliases
setMethod("dbDriver", signature("character"), dbDriver_character)

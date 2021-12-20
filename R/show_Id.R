#' @rdname hidden_aliases
#' @param object Table object to print
#' @usage NULL
show_Id <- function(object) {
  cat(toString(object), "\n", sep = "")
}
#' @rdname hidden_aliases
#' @export
setMethod("show", signature("Id"), show_Id)

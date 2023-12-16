#' @rdname hidden_aliases
#' @param object Table object to print
#' @usage NULL
show_UnnamedId <- function(object) {
  cat(toString(object), "\n", sep = "")
}
#' @rdname hidden_aliases
#' @export
setMethod("show", signature("UnnamedId"), show_UnnamedId)

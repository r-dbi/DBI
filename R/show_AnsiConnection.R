#' @rdname hidden_aliases
#' @usage NULL
show_AnsiConnection <- function(object) {
  cat("<AnsiConnection>\n")
}

#' @rdname hidden_aliases
#' @export
setMethod("show", "AnsiConnection", show_AnsiConnection)

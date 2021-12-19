#' @rdname hidden_aliases
#' @param object Object to display
#' @usage NULL
show_DBIConnector <- function(object) {
  cat("<DBIConnector>")
  show(object@.drv)
  cat("Arguments:\n")
  show(object@.conn_args)
  invisible(NULL)
}
#' @rdname hidden_aliases
#' @export
setMethod("show", signature("DBIConnector"), show_DBIConnector)

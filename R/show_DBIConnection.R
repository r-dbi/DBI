#' @rdname hidden_aliases
#' @param object Object to display
#' @usage NULL
show_DBIConnection <- function(object) {
  # to protect drivers that fail to implement the required methods (e.g.,
  # RPostgreSQL)
  tryCatch(
    show_connection(object),
    error = function(e) NULL
  )
  invisible(NULL)
}
#' @rdname hidden_aliases
#' @export
setMethod("show", "DBIConnection", show_DBIConnection)

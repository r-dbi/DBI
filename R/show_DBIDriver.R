#' @rdname hidden_aliases
#' @param object Object to display
#' @usage NULL
show_DBIDriver <- function(object) {
  tryCatch(
    # to protect drivers that fail to implement the required methods (e.g.,
    # RPostgreSQL)
    show_driver(object),
    error = function(e) NULL
  )
  invisible(NULL)
}
#' @rdname hidden_aliases
#' @export
setMethod("show", signature("DBIDriver"), show_DBIDriver)

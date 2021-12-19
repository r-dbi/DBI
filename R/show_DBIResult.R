#' @rdname hidden_aliases
#' @param object Object to display
#' @usage NULL
show_DBIResult <- function(object) {
  # to protect drivers that fail to implement the required methods (e.g.,
  # RPostgreSQL)
  tryCatch(
    show_result(object),
    error = function(e) NULL
  )
  invisible(NULL)
}
#' @rdname hidden_aliases
#' @export
setMethod("show", signature("DBIResult"), show_DBIResult)

#' @rdname hidden_aliases
#' @usage NULL
show_SQL <- function(object) {
  cat(paste0("<SQL> ", object@.Data, collapse = "\n"), "\n", sep = "")
}
#' @rdname hidden_aliases
#' @export
setMethod("show", "SQL", show_SQL)

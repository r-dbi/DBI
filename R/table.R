#' @rdname Table
setClass("Table", slots = list(name = "character"))

#' Refer to a table nested in a hierarchy (e.g. within a schema)
#'
#' @param ... Components of the hierarchy, e.g. `schema`, `table`,
#'   or `cluster`, `catalog`, `schema`, `table`.
#'   For more on these concepts, see
#'   \url{http://stackoverflow.com/questions/7022755/}
Table <- function(...) {
  new("Table", name = c(...))
}

#' @rdname hidden_aliases
#' @param object Table object to print
#' @export
setMethod("show", signature("Table"), function(object) {
  cat("<Table> ", paste0(object@name, collapse = "."), "\n", sep = "")
})

#' @rdname hidden_aliases
#' @export
setMethod("dbQuoteIdentifier", signature("DBIConnection", "Table"), quote_identifier)

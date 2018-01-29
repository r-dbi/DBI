#' @rdname Table
setClass("Table", slots = list(name = "character"))

#' Refer to a table nested in a hierarchy (e.g. within a schema)
#'
#' Objects of class `Table` have a single slot `name`, which is a named
#' character vector.
#'
#' @param ... Components of the hierarchy, e.g. `schema`, `table`,
#'   or `cluster`, `catalog`, `schema`, `table`.
#'   For more on these concepts, see
#'   \url{http://stackoverflow.com/questions/7022755/}
#' @export
Table <- function(...) {
  new("Table", name = c(...))
}

#' @rdname hidden_aliases
#' @param object Table object to print
#' @export
setMethod("show", signature("Table"), function(object) {
  cat(toString(object), "\n", sep = "")
})

#' @export
toString.Table <- function(x, ...) {
  paste0("<Table> ", paste(x@name, collapse = "."))
}

#' @rdname hidden_aliases
#' @export
setMethod("dbQuoteIdentifier", signature("DBIConnection", "Table"), quote_identifier)

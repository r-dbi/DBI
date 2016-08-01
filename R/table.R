#' @rdname Table
setClass("Table", slots = list(name = "character"))

#' Refer to a table nested in a hierarchy (e.g. within a schema)
#'
#' @param ... Components of the hierarchy, e.g. \code{schema}, \code{table},
#'   or \code{cluster}, \code{catalog}, \code{schema}, \code{table}.
#'   For more on these concepts, see
#'   \url{http://stackoverflow.com/questions/7022755/}
Table <- function(...) {
  new("Table", name = c(...))
}

#' @rdname hidden_aliases
#' @param conn,x Connection and Table used when escaping.
#' @export
setMethod("dbQuoteIdentifier", c("DBIConnection", "Table"),
  function(conn, x, ...) {
    SQL(paste0(dbQuoteIdentifier(conn, x@name), collapse = "."))
  }
)

#' @rdname hidden_aliases
#' @param object Table object to print
#' @export
setMethod("show", "Table", function(object) {
  cat("<Table> ", paste0(object@name, collapse = "."), "\n", sep = "")
})

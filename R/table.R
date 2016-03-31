#' @rdname Table
setClass("Table", slots = list(name = "character"))

#' Refer to a table nested in a hierarchy (e.g. within a schema)
#'
#' @param ... Components of the hierarchy, e.g. \code{schema}, \code{table},
#'   or \code{cluster}, \code{catalog}, \code{schema}, \code{table}.
#'   For more on these concepts, see
#'   \url{http://stackoverflow.com/questions/7022755/}
#' @param conn,x Connection and Table used when escaping.
#' @param object Table object to print
Table <- function(...) {
  new("Table", name = c(...))
}

#' @export
#' @rdname Table
setMethod("dbQuoteIdentifier", c("DBIConnection", "Table"),
  function(conn, x, ...) {
    SQL(paste0(dbQuoteIdentifier(conn, x@name), collapse = "."))
  }
)

#' @export
#' @rdname Table
setMethod("show", "Table", function(object) {
  cat("<Table> ", paste0(object@name, collapse = "."), "\n", sep = "")
})

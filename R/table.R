#' @include hidden.R
NULL

#' @rdname Id
setClass("Id", slots = list(name = "character"))

#' Refer to a table nested in a hierarchy (e.g. within a schema)
#'
#' Objects of class `Id` have a single slot `name`, which is a named
#' character vector.
#' The [dbQuoteIdentifier()] method converts `Id` objects to strings.
#' Support for `Id` objects depends on the database backend.
#' They can be used in the following methods as `name` argument:
#' - [dbCreateTable()]
#' - [dbAppendTable()]
#' - [dbReadTable()]
#' - [dbWriteTable()]
#' - [dbExistsTable()]
#' - [dbRemoveTable()]
#' Objects of this class are also returned from [dbListObjects()].
#'
#' @param ... Components of the hierarchy, e.g. `schema`, `table`,
#'   or `cluster`, `catalog`, `schema`, `table`.
#'   For more on these concepts, see
#'   \url{https://stackoverflow.com/questions/7022755/}
#' @export
#' @examples
#' Id(schema = "dbo", table = "Customer")
#' dbQuoteIdentifier(ANSI(), Id(schema = "nycflights13", table = "flights"))
#' Id(cluster = "mycluster", catalog = "mycatalog", schema = "myschema", table = "mytable")
Id <- function(...) {
  components <- c(...)
  if (is.null(names(components)) || any(names(components) == "")) {
    stop("All arguments to Id() must be named.", call. = FALSE)
  }
  new("Id", name = components)
}

#' @rdname hidden_aliases
#' @param object Table object to print
#' @export
setMethod("show", signature("Id"), function(object) {
  cat(toString(object), "\n", sep = "")
})

#' @export
toString.Id <- function(x, ...) {
  paste0("<Id> ", paste0(names(x@name), " = ", x@name, collapse = ", "))
}

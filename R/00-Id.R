NULL

#' @rdname Id
setClass("Id", slots = list(name = "character"))

#' Refer to a table nested in a hierarchy (e.g. within a schema)
#'
#' @description
#' Objects of class `Id` have a single slot `name`, which is a character vector.
#' The [dbQuoteIdentifier()] method converts `Id` objects to strings.
#' Support for `Id` objects depends on the database backend.
#'
#' They can be used in the following methods as `name` or `table` argument:
#'
#' - [dbCreateTable()]
#' - [dbAppendTable()]
#' - [dbReadTable()]
#' - [dbWriteTable()]
#' - [dbExistsTable()]
#' - [dbRemoveTable()]
#'
#' Objects of this class are also returned from [dbListObjects()].
#'
#' @param ... Components of the hierarchy, e.g. `schema`, `table`, or `cluster`,
#'  `catalog`, `schema`, `table`, depending on the database backend. For more
#'  on these concepts, see <https://stackoverflow.com/questions/7022755/>
#' @export
#' @examples
#' # Identifies a table in a specific schema:
#' Id("dbo", "Customer")
#' # You can name the components if you want, but it's not needed
#' Id(schema = "dbo", table = "Customer")
#'
#' # Create a SQL expression for an identifier:
#' dbQuoteIdentifier(ANSI(), Id("nycflights13", "flights"))
#'
#' # Write a table in a specific schema:
#' \dontrun{
#' dbWriteTable(con, Id("myschema", "mytable"), data.frame(a = 1))
#' }
Id <- function(...) {
  components <- c(...)
  if (!is.character(components)) {
    stop("All elements of `...` must be strings.", call. = FALSE)
  }

  new("Id", name = c(...))
}

#' @export
toString.Id <- function(x, ...) {
  paste0("<Id> ", dbQuoteIdentifier(ANSI(), x))
}


dbQuoteIdentifier_DBIConnection_Id <- function(conn, x, ...) {
  SQL(paste0(dbQuoteIdentifier(conn, x@name), collapse = "."))
}

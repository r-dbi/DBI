NULL

#' @rdname Id
setClass("UnnamedId", slots = list(name = "character"))

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
#' @param ... Components of the hierarchy, e.g. `cluster`,
#'  `catalog`, `schema`, or `table`, depending on the database backend. For more
#'  on these concepts, see <https://stackoverflow.com/questions/7022755/>
#' @export
#' @examples
#' # Identifies a table in a specific schema:
#' Id("dbo", "Customer")
#'
#' # You can name the components if you want, but it's not needed
#' Id(schema = "dbo", table = "Customer")
#'
#' # If the names are given out of order, the correct order is restored
#' Id(table = "Customer", schema = "dbo")
#'
#' # Create a SQL expression for an identifier:
#' dbQuoteIdentifier(ANSI(), Id("nycflights13", "flights"))
#'
#' # Write a table in a specific schema:
#' \dontrun{
#' dbWriteTable(con, Id("myschema", "mytable"), data.frame(a = 1))
#' }
Id <- function(...) {
  components <- orderIdParams(...)
  if (!is.character(components)) {
    stop("All elements of `...` must be strings.", call. = FALSE)
  }

  if (is.null(names(components))) {
    new("UnnamedId", name = components)
  } else {
    if (any(names(components) == "")) {
      stop("All arguments to Id() must be named or unnamed.", call. = FALSE)
    }
    new("Id", name = components)
  }
}

#' @export
toString.UnnamedId <- function(x, ...) {
  paste0("<UnnamedId> ", dbQuoteIdentifier(ANSI(), x))
}


dbQuoteIdentifier_DBIConnection_UnnamedId <- function(conn, x, ...) {
  SQL(paste0(dbQuoteIdentifier(conn, x@name), collapse = "."))
}


NULL

#' @rdname Id
setClass("Id", contains = "UnnamedId")

#' @export
toString.Id <- function(x, ...) {
  paste0("<Id> ", paste0(names(x@name), " = ", x@name, collapse = ", "))
}

orderIdParams <- function(..., database = NULL,
                          catalog = NULL, cluster = NULL,
                          schema = NULL, table = NULL) {
  c(database = database,
    cluster = cluster,
    catalog = catalog,
    schema = schema,
    ...,
    table = table
  )
}

#' SQL quoting
#'
#' This set of classes and generics make it possible to flexibly deal with SQL
#' escaping needs. By default, any user supplied input to a query should be
#' escaped using either [dbQuoteIdentifier()] or [dbQuoteString()]
#' depending on whether it refers to a table or variable name, or is a literal
#' string.
#' These functions may return an object of the `SQL` class,
#' which tells DBI functions that a character string does not need to be escaped
#' anymore, to prevent double escaping.
#' The `SQL` class has associated the `SQL()` constructor function.
#'
#' @section Implementation notes:
#'
#' DBI provides default generics for SQL-92 compatible quoting. If the database
#' uses a different convention, you will need to provide your own methods.
#' Note that because of the way that S4 dispatch finds methods and because
#' SQL inherits from character, if you implement (e.g.) a method for
#' `dbQuoteString(MyConnection, character)`, you will also need to
#' implement `dbQuoteString(MyConnection, SQL)` - this should simply
#' return `x` unchanged.
#'
#' @param x A character vector to label as being escaped SQL.
#' @param ... Other arguments passed on to methods. Not otherwise used.
#' @param names Names for the returned object, must have the same length as `x`.
#' @return An object of class `SQL`.
#' @export
#' @examples
#' dbQuoteIdentifier(ANSI(), "SELECT")
#' dbQuoteString(ANSI(), "SELECT")
#'
#' # SQL vectors are always passed through as is
#' var_name <- SQL("SELECT")
#' var_name
#'
#' dbQuoteIdentifier(ANSI(), var_name)
#' dbQuoteString(ANSI(), var_name)
#'
#' # This mechanism is used to prevent double escaping
#' dbQuoteString(ANSI(), dbQuoteString(ANSI(), "SELECT"))
SQL <- function(x, ..., names = NULL) {
  if (!is.null(names)) {
    stopifnot(length(x) == length(names))
  }
  names(x) <- names
  new("SQL", x)
}

#' @rdname SQL
#' @export
#' @aliases
#'   SQL-class
setClass("SQL", contains = "character")

#' @export
`[.SQL` <- function(x, ...) SQL(NextMethod())

#' @export
`[[.SQL` <- function(x, ...) SQL(NextMethod())

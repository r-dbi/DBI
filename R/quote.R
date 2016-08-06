#' @include DBConnection.R
NULL

#' SQL quoting
#'
#' This set of classes and generics make it possible to flexibly deal with SQL
#' escaping needs. By default, any user supplied input to a query should be
#' escaped using either \code{dbQuoteIdentifier} or \code{dbQuoteString}
#' depending on whether it refers to a table or variable name, or is a literal
#' string.
#' These functions return an object of the \code{SQL} class,
#' which tells DBI functions that a character string does not need to be escaped
#' anymore, to prevent double escaping.
#' The \code{SQL} class has associated the \code{SQL()} constructor function.
#'
#' @section Implementation notes:
#'
#' DBI provides default generics for SQL-92 compatible quoting. If the database
#' uses a different convention, you will need to provide your own methods.
#' Note that because of the way that S4 dispatch finds methods and because
#' SQL inherits from character, if you implement (e.g.) a method for
#' \code{dbQuoteString(MyConnection, character)}, you will also need to
#' implement \code{dbQuoteString(MyConnection, SQL)} - this should simply
#' return \code{x} unchanged.
#'
#' If you implement your own method, make sure to convert NA to NULL (unquoted).
#'
#' @param conn A subclass of \code{\linkS4class{DBIConnection}}, representing
#'   an active connection to an DBMS.
#' @param x A character vector to label as being escaped SQL.
#' @param ... Other arguments passed on to methods. Not otherwise used.
#' @return An object of class \code{SQL}.
#' @export
#' @examples
#' # Quoting ensures that arbitrary input is safe for use in a query
#' name <- "Robert'); DROP TABLE Students;--"
#' dbQuoteString(ANSI(), name)
#' dbQuoteIdentifier(ANSI(), name)
#'
#' # NAs become NULL
#' dbQuoteString(ANSI(), c("x", NA))
#'
#' # SQL vectors are always passed through as is
#' var_name <- SQL("select")
#' var_name
#'
#' dbQuoteIdentifier(ANSI(), var_name)
#' dbQuoteString(ANSI(), var_name)
#'
#' # This mechanism is used to prevent double escaping
#' dbQuoteString(ANSI(), dbQuoteString(ANSI(), name))
SQL <- function(x) new("SQL", x)

#' @rdname SQL
#' @export
#' @aliases
#'   SQL-class
setClass("SQL", contains = "character")

#' @rdname hidden_aliases
#' @export
setMethod("show", "SQL", function(object) {
  cat(paste0("<SQL> ", object@.Data, collapse = "\n"), "\n", sep = "")
})


#' @rdname SQL
#' @family DBIResult generics
#' @export
setGeneric("dbQuoteIdentifier", function(conn, x, ...) {
  standardGeneric("dbQuoteIdentifier")
})

#' @rdname hidden_aliases
#' @export
setMethod("dbQuoteIdentifier", c("DBIConnection", "character"),
  function(conn, x, ...) {
    x <- gsub('"', '""', x, fixed = TRUE)
    SQL(paste('"', encodeString(x), '"', sep = ""))
  }
)

#' @rdname hidden_aliases
#' @export
setMethod("dbQuoteIdentifier", c("DBIConnection", "SQL"),
  function(conn, x, ...) {
    x
  }
)

#' @rdname SQL
#' @family DBIResult generics
#' @export
setGeneric("dbQuoteString", function(conn, x, ...) {
  standardGeneric("dbQuoteString")
})

#' @rdname hidden_aliases
#' @export
setMethod("dbQuoteString", c("DBIConnection", "character"),
  function(conn, x, ...) {
    x <- gsub("'", "''", x, fixed = TRUE)

    # Not calling encodeString() here, see also http://stackoverflow.com/a/549244/946850
    # and especially the comment by Álvaro González
    str <- paste("'", x, "'", sep = "")
    str[is.na(x)] <- "NULL"
    SQL(str)
  }
)

#' @rdname hidden_aliases
#' @export
setMethod("dbQuoteString", c("DBIConnection", "SQL"),
  function(conn, x, ...) {
    x
  }
)

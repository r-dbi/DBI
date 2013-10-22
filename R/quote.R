#' @include DBConnection.R
NULL

#' SQL quoting.
#' 
#' This set of classes and generics make it possible to flexibly deal with SQL
#' escaping needs. By default, any user supplied input to a query should be 
#' escaped using either \code{dbQuoteIdentifier} or \code{dbQuoteString} 
#' depending on whether it refers to a table or variable name, or is a literal
#' string.
#' 
#' The SQL class has associated \code{SQL()} constructor function. This class
#' is used to prevent double escaping of SQL strings, and to make it possible
#' to tell DBI functions that you've done the escaping yourself.
#' 
#' @section Implementation notes:
#' 
#' DBI provides default methods for SQL-92 compatible quoting. If the database
#' uses a different convention, you will need to provide your own methods.
#' Note that because of the way that S4 dispatch finds methods and because
#' SQL inherits from character, if you implement (e.g.) a method for 
#' \code{dbQuoteString(MyConnection, character)}, you will also need to 
#' implement \code{dbQuoteString(MyConnection, SQL)} - this should simply 
#' return \code{x} unchanged.
#' 
#' @param conn A subclass of \code{\linkS4class{DBIConnection}}, representing 
#'   an active connection to an DBMS. 
#' @param x A character vector to label as being escaped SQL.
#' @param ... Other arguments passed on to methods. Not otherwise used.
#' @export
#' @examples
#' # Create a subclass of DBI connection since it's virtual
#' MockConnection <- setClass("MockConnection", "DBIConnection")
#' conn <- MockConnection()
#' 
#' # Quoting ensures that arbitrary input is safe for use in a query
#' name <- "Robert'); DROP TABLE Students;--"
#' dbQuoteString(conn, name)
#' dbQuoteIdentifier(conn, name)
#' 
#' # SQL vectors are always passed through as is
#' var_name <- SQL("select")
#' var_name
#' 
#' dbQuoteIdentifier(conn, var_name)
#' dbQuoteString(conn, var_name)
#' 
#' # This mechanism is used to prevent double escaping
#' dbQuoteString(conn, dbQuoteString(conn, name))
SQL <- function(x) new("SQL", x)

#' @rdname SQL
#' @export
#' @aliases 
#'   SQL-class
#'   show,SQL-method
setClass("SQL", contains = "character")
setMethod("show", "SQL", function(object) {
  cat(paste0("<SQL> ", object@.Data, collapse = "\n"))
})


#' @rdname SQL
#' @export
#' @aliases 
#'   dbQuoteIdentifier,DBIConnection,character-method
#'   dbQuoteIdentifier,DBIConnection,SQL-method
setGeneric("dbQuoteIdentifier", function(conn, x, ...) {
  standardGeneric("dbQuoteIdentifier")
})
setMethod("dbQuoteIdentifier", c("DBIConnection", "character"), 
  function(conn, x, ...) {
    x <- gsub('"', '""', x, fixed = TRUE)
    SQL(paste('"', x, '"', sep = ""))
  }
)
setMethod("dbQuoteIdentifier", c("DBIConnection", "SQL"), 
  function(conn, x, ...) {
    x
  }
)

#' @rdname SQL
#' @export
#' @aliases
#'   dbQuoteString,DBIConnection,character-method
#'   dbQuoteString,DBIConnection,SQL-method
setGeneric("dbQuoteString", function(conn, x, ...) {
  standardGeneric("dbQuoteString")
})
setMethod("dbQuoteString", c("DBIConnection", "character"), 
  function(conn, x, ...) {
    x <- gsub("'", "''", x, fixed = TRUE)
    SQL(paste("'", x, "'", sep = ""))
  }
)
setMethod("dbQuoteString", c("DBIConnection", "SQL"), 
  function(conn, x, ...) {
    x
  }
)

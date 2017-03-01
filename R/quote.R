#' @include DBConnection.R
NULL

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


#' Quote identifiers
#'
#' Call this method to generate a string that is suitable for
#' use in a query as a column name, to make sure that you
#' generate valid SQL and avoid SQL injection.
#'
#' @param conn A subclass of [DBIConnection-class], representing
#'   an active connection to an DBMS.
#' @param x A character vector to quote as identifier.
#' @param ... Other arguments passed on to methods.
#'
#' @inherit DBItest::spec_sql_quote_identifier return
#' @inheritSection DBItest::spec_sql_quote_identifier Specification
#'
#' @family DBIResult generics
#' @export
#' @examples
#' # Quoting ensures that arbitrary input is safe for use in a query
#' name <- "Robert'); DROP TABLE Students;--"
#' dbQuoteIdentifier(ANSI(), name)
#'
#' # SQL vectors are always passed through as is
#' var_name <- SQL("select")
#' var_name
#'
#' dbQuoteIdentifier(ANSI(), var_name)
#'
#' # This mechanism is used to prevent double escaping
#' dbQuoteIdentifier(ANSI(), dbQuoteIdentifier(ANSI(), name))
setGeneric(
  "dbQuoteIdentifier",
  function(conn, x, ...) standardGeneric("dbQuoteIdentifier")
)

#' @rdname hidden_aliases
#' @export
setMethod("dbQuoteIdentifier", c("DBIConnection", "character"),
  function(conn, x, ...) {
    if (any(is.na(x))) {
      stop("Cannot pass NA to dbQuoteIdentifier()", call. = FALSE)
    }
    x <- gsub('"', '""', x, fixed = TRUE)
    if (length(x) == 0L) {
      SQL(character())
    } else {
      # Not calling encodeString() here to keep things simple
      SQL(paste('"', x, '"', sep = ""))
    }
  }
)

#' @rdname hidden_aliases
#' @export
setMethod("dbQuoteIdentifier", c("DBIConnection", "SQL"),
  function(conn, x, ...) {
    x
  }
)

#' Quote literal strings
#'
#' Call this method to generate a string that is suitable for
#' use in a query as a string literal, to make sure that you
#' generate valid SQL and avoid SQL injection.
#'
#' @param conn A subclass of [DBIConnection-class], representing
#'   an active connection to an DBMS.
#' @param x A character vector to quote as string.
#' @param ... Other arguments passed on to methods.
#'
#' @inherit DBItest::spec_sql_quote_string return
#' @inheritSection DBItest::spec_sql_quote_string Specification
#'
#' @family DBIResult generics
#' @export
#' @examples
#' # Quoting ensures that arbitrary input is safe for use in a query
#' name <- "Robert'); DROP TABLE Students;--"
#' dbQuoteString(ANSI(), name)
#'
#' # NAs become NULL
#' dbQuoteString(ANSI(), c("x", NA))
#'
#' # SQL vectors are always passed through as is
#' var_name <- SQL("select")
#' var_name
#' dbQuoteString(ANSI(), var_name)
#'
#' # This mechanism is used to prevent double escaping
#' dbQuoteString(ANSI(), dbQuoteString(ANSI(), name))
setGeneric(
  "dbQuoteString",
  function(conn, x, ...) standardGeneric("dbQuoteString")
)

#' @rdname hidden_aliases
#' @export
setMethod("dbQuoteString", c("DBIConnection", "character"),
  function(conn, x, ...) {
    x <- gsub("'", "''", x, fixed = TRUE)

    if (length(x) == 0L) {
      SQL(character())
    } else {
      # Not calling encodeString() here, see also http://stackoverflow.com/a/549244/946850
      # and especially the comment by Álvaro González
      str <- paste("'", x, "'", sep = "")
      str[is.na(x)] <- "NULL"
      SQL(str)
    }
  }
)

#' @rdname hidden_aliases
#' @export
setMethod("dbQuoteString", c("DBIConnection", "SQL"),
  function(conn, x, ...) {
    x
  }
)

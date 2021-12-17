#' @include hidden.R
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

quote_identifier <-
  function(conn, x, ...) {
    # Don't support lists, auto-vectorization violates type stability
    if (is(x, "SQL")) return(x)
    if (is(x, "Id")) {
      return(SQL(paste0(dbQuoteIdentifier(conn, x@name), collapse = ".")))
    }
    if (!is.character(x)) stop("x must be character or SQL", call. = FALSE)

    if (any(is.na(x))) {
      stop("Cannot pass NA to dbQuoteIdentifier()", call. = FALSE)
    }
    # Avoid fixed = TRUE due to https://github.com/r-dbi/DBItest/issues/156
    x <- gsub('"', '""', enc2utf8(x))
    if (length(x) == 0L) {
      SQL(character(), names = names(x))
    } else {
      # Not calling encodeString() here to keep things simple
      SQL(paste('"', x, '"', sep = ""), names = names(x))
    }
  }

#' @rdname hidden_aliases
#' @export
setMethod("dbQuoteIdentifier", signature("DBIConnection"), quote_identifier)

# Need to keep other method declarations around for now, because clients might
# use getMethod(), see e.g. https://github.com/r-dbi/odbc/pull/149
#' @rdname hidden_aliases
#' @export
setMethod("dbQuoteIdentifier", signature("DBIConnection", "character"), quote_identifier)

#' @rdname hidden_aliases
#' @export
setMethod("dbQuoteIdentifier", signature("DBIConnection", "SQL"), quote_identifier)

#' @rdname hidden_aliases
#' @export
setMethod("dbQuoteIdentifier", signature("DBIConnection", "Id"), quote_identifier)

as_table <- function(catalog, schema, table) {
  args <- c(catalog = catalog, schema = schema, table = table)
  # Also omits NA args
  args <- args[!is.na(args) & args != ""]
  do.call(Id, as.list(args))
}

quote_string <-
  function(conn, x, ...) {
    if (is(x, "SQL")) return(x)
    if (!is.character(x)) stop("x must be character or SQL", call. = FALSE)

    # Avoid fixed = TRUE due to https://github.com/r-dbi/DBItest/issues/156
    x <- gsub("'", "''", enc2utf8(x))

    if (length(x) == 0L) {
      SQL(character())
    } else {
      # Not calling encodeString() here, see also https://stackoverflow.com/a/549244/946850
      # and especially the comment by Álvaro González
      str <- paste("'", x, "'", sep = "")
      str[is.na(x)] <- "NULL"
      SQL(str)
    }
  }

# Need to keep other method declarations around for now, because clients might
# use getMethod(), see e.g. https://github.com/r-dbi/odbc/pull/149
#' @rdname hidden_aliases
#' @export
setMethod("dbQuoteString", signature("DBIConnection"), quote_string)

#' @rdname hidden_aliases
#' @export
setMethod("dbQuoteString", signature("DBIConnection", "character"), quote_string)

#' @rdname hidden_aliases
#' @export
setMethod("dbQuoteString", signature("DBIConnection", "SQL"), quote_string)


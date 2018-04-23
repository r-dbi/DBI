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

#' @rdname hidden_aliases
#' @export
setMethod("show", "SQL", function(object) {
  cat(paste0("<SQL> ", object@.Data, collapse = "\n"), "\n", sep = "")
})

#' @export
`[.SQL` <- function(x, ...) SQL(NextMethod())

#' @export
`[[.SQL` <- function(x, ...) SQL(NextMethod())

#' Quote identifiers
#'
#' Call this method to generate a string that is suitable for
#' use in a query as a column or table name, to make sure that you
#' generate valid SQL and protect against SQL injection attacks. The inverse
#' operation is [dbUnquoteIdentifier()].
#'
#' @param conn A subclass of [DBIConnection-class], representing
#'   an active connection to an DBMS.
#' @param x A character vector, [SQL] or [Id] object to quote as identifier.
#' @param ... Other arguments passed on to methods.
#'
#' @template methods
#' @templateVar method_name dbQuoteIdentifier
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
setGeneric("dbQuoteIdentifier",
  def = function(conn, x, ...) standardGeneric("dbQuoteIdentifier")
)

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

#' Unquote identifiers
#'
#' Call this method to convert a [SQL] object created by [dbQuoteIdentifier()]
#' back to a list of [Id] objects.
#'
#' @param conn A subclass of [DBIConnection-class], representing
#'   an active connection to an DBMS.
#' @param x An [SQL] or [Id] object or character vector to unquote.
#' @param ... Other arguments passed on to methods.
#'
#' @template methods
#' @templateVar method_name dbUnquoteIdentifier
#'
#' @inherit DBItest::spec_sql_unquote_identifier return
#' @inheritSection DBItest::spec_sql_unquote_identifier Specification
#'
#' @family DBIResult generics
#' @export
#' @examples
#' # Unquoting allows to understand the structure of a
#' # possibly complex quoted identifier
#' dbUnquoteIdentifier(
#'   ANSI(),
#'   SQL(c('"Schema"."Table"', '"UnqualifiedTable"'))
#' )
#'
#' # The returned object is always a list,
#' # also for Id objects
#' dbUnquoteIdentifier(
#'   ANSI(),
#'   Id(schema = "Schema", table = "Table")
#' )
#'
#' # Quoting is the inverse operation to unquoting the elements
#' # of the returned list
#' dbQuoteIdentifier(
#'   ANSI(),
#'   dbUnquoteIdentifier(ANSI(), SQL("UnqualifiedTable"))[[1]]
#' )
#'
#' dbQuoteIdentifier(
#'   ANSI(),
#'   dbUnquoteIdentifier(ANSI(), Id(schema = "Schema", table = "Table"))[[1]]
#' )
setGeneric("dbUnquoteIdentifier",
  def = function(conn, x, ...) standardGeneric("dbUnquoteIdentifier")
)

#' @rdname hidden_aliases
#' @export
setMethod("dbUnquoteIdentifier", signature("DBIConnection"), function(conn, x, ...) {
  if (is(x, "SQL")) {
    rx <- '^(?:(?:|"((?:[^"]|"")+)"[.])(?:|"((?:[^"]|"")*)")|([^". ]+))$'
    bad <- grep(rx, x, invert = TRUE)
    if (length(bad) > 0) {
      stop("Can't unquote ", x[bad[[1]]], call. = FALSE)
    }
    schema <- gsub(rx, "\\1", x)
    schema <- gsub('""', '"', schema)
    table <- gsub(rx, "\\2", x)
    table <- gsub('""', '"', table)
    naked_table <- gsub(rx, "\\3", x)

    ret <- Map(schema, table, naked_table, f = as_table)
    names(ret) <- names(x)
    return(ret)
  }
  if (is(x, "Id")) {
    return(list(x))
  }
  stop("x must be SQL or Id", call. = FALSE)
})

as_table <- function(schema, table, naked_table = NULL) {
  args <- c(schema = schema, table = table, table = naked_table)
  # Also omits NA args
  args <- args[!is.na(args) & args != ""]
  do.call(Id, as.list(args))
}

#' Quote literal strings
#'
#' Call this method to generate a string that is suitable for
#' use in a query as a string literal, to make sure that you
#' generate valid SQL and protect against SQL injection attacks.
#'
#' @param conn A subclass of [DBIConnection-class], representing
#'   an active connection to an DBMS.
#' @param x A character vector to quote as string.
#' @param ... Other arguments passed on to methods.
#'
#' @template methods
#' @templateVar method_name dbQuoteString
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
setGeneric("dbQuoteString",
  def = function(conn, x, ...) standardGeneric("dbQuoteString")
)

quote_string <-
  function(conn, x, ...) {
    if (is(x, "SQL")) return(x)
    if (!is.character(x)) stop("x must be character or SQL", call. = FALSE)

    # Avoid fixed = TRUE due to https://github.com/r-dbi/DBItest/issues/156
    x <- gsub("'", "''", enc2utf8(x))

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

#' Quote literal values
#'
#' @description
#' Call these methods to generate a string that is suitable for
#' use in a query as a literal value of the correct type, to make sure that you
#' generate valid SQL and protect against SQL injection attacks.
#'
#' @inheritParams dbQuoteString
#' @param x A vector to quote as string.
#'
#' @template methods
#' @templateVar method_name dbQuoteLiteral
#'
#' @inherit DBItest::spec_sql_quote_literal return
#' @inheritSection DBItest::spec_sql_quote_literal Specification
#'
#' @family DBIResult generics
#' @export
#' @examples
#' # Quoting ensures that arbitrary input is safe for use in a query
#' name <- "Robert'); DROP TABLE Students;--"
#' dbQuoteLiteral(ANSI(), name)
#'
#' # NAs become NULL
#' dbQuoteLiteral(ANSI(), c(1:3, NA))
#'
#' # Logicals become integers by default
#' dbQuoteLiteral(ANSI(), c(TRUE, FALSE, NA))
#'
#' # Raw vectors become hex strings by default
#' dbQuoteLiteral(ANSI(), list(as.raw(1:3), NULL))
#'
#' # SQL vectors are always passed through as is
#' var_name <- SQL("select")
#' var_name
#' dbQuoteLiteral(ANSI(), var_name)
#'
#' # This mechanism is used to prevent double escaping
#' dbQuoteLiteral(ANSI(), dbQuoteLiteral(ANSI(), name))
setGeneric("dbQuoteLiteral",
  def = function(conn, x, ...) standardGeneric("dbQuoteLiteral")
)



#' @rdname hidden_aliases
#' @export
setMethod("dbQuoteLiteral", signature("DBIConnection"),
  function(conn, x, ...) {
    # Switchpatching to avoid ambiguous S4 dispatch, so that our method
    # is used only if no alternatives are available.

    if (is(x, "SQL")) return(x)

    if (is.factor(x)) return(dbQuoteString(conn, as.character(x)))

    if (is.character(x)) return(dbQuoteString(conn, x))

    if (inherits(x, "POSIXt")) {
      return(dbQuoteString(
        conn,
        strftime(as.POSIXct(x), "%Y%m%d%H%M%S", tz = "UTC")
      ))
    }

    if (inherits(x, "Date")) return(dbQuoteString(conn, as.character(x, usetz = TRUE)))

    if (is.list(x)) {
      blob_data <- vapply(
        x,
        function(x) {
          if (is.null(x)) {
            "NULL"
          } else if (is.raw(x)) {
            paste0("X'", paste(format(x), collapse = ""), "'")
          } else {
            stop("Lists must contain raw vectors or NULL", call. = FALSE)
          }
        },
        character(1)
      )
      return(SQL(blob_data, names = names(x)))
    }

    if (is.logical(x)) x <- as.numeric(x)
    x <- as.character(x)
    x[is.na(x)] <- "NULL"
    SQL(x, names = names(x))
  }
)

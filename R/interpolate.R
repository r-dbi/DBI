#' Safely interpolate values into an SQL string.
#'
#' @section Backend authors:
#' If you are implementing a SQL backend with non-ANSI quoting rules, you'll
#' need to implement a method for \code{\link{sqlParseVariables}}. Failure to
#' do so does not expose you to SQL injection attacks, but will (rarely) result
#' in errors matching supplied and interpolated variables.
#'
#' @param _con A database connection.
#' @param `_sql` A SQL string containing containing variables to interpolate.
#'   Variables must start with a question mark and can be any valid R
#'   identifier, i.e. it must start with a letter or \code{.}, and be followed
#'   by a letter, digit, \code{.} or \code{_}.
#' @param ... Named values to interpolate into string. All strings
#'   will be first escaped with \code{\link[DBI]{dbQuoteString}} prior
#'   to interpolation to protect against SQL interpolation attacks.
#' @export
#' @examples
#' sql <- "SELECT * FROM X WHERE name = ?name"
#' sqlInterpolate(ANSI(), sql, name = "Hadley")
#' # This is safe because the single quote has been double escaped
#' sqlInterpolate(ANSI(), sql, name = "H'); DROP TABLE--;")
setGeneric("sqlInterpolate", function(`_con`, `_sql`, ...) {
  standardGeneric("sqlInterpolate")
})

#' @export
#' @rdname sqlInterpolate
setMethod("sqlInterpolate", "DBIConnection", function(`_con`, `_sql`, ...) {
  sql <- `_sql`
  pos <- sqlParseVariables(`_con`, sql)

  if (length(pos$start) == 0)
    return(SQL(sql))

  vars <- substring(sql, pos$start + 1, pos$end)

  values <- list(...)
  if (!setequal(vars, names(values))) {
    stop("Supplied vars don't match vars to interpolate", call. = FALSE)
  }
  values <- values[vars]

  safe_values <- vapply(values, function(x) {
    if (is.character(x)) {
      dbQuoteString(`_con`, x)
    } else {
      as.character(x)
    }
  }, character(1))

  for (i in rev(seq_along(vars))) {
    sql <- paste0(
      substring(sql, 0, pos$start[i] - 1),
      safe_values[i],
      substring(sql, pos$end[i] + 1, nchar(sql))
    )
  }

  SQL(sql)
})

#' Parse interpolated variables from SQL.
#'
#' If you're implementing a backend that uses non-ANSI quoting or commenting
#' rules, you'll need to implement a method for \code{sqlParseVariables} that
#' calls \code{sqlParseVariablesImpl} with the appropriate quote and
#' comment specifications.
#'
#'
#' @param start,end Start and end characters for quotes and comments
#' @param endRequired Is the ending character of a comment required?
#' @param doubleEscape Can quoting characters be escaped by doubling them?
#'   Defaults to \code{TRUE}.
#' @param escape What character can be used to escape quoting characters?
#'   Defaults to \code{""}, i.e. nothing.
#' @keywords internal
#' @export
#' @examples
#' # Use [] for quoting and no comments
#' sqlParseVariablesImpl("[?a]",
#'   list(sqlQuoteSpec("[", "]", "\\", FALSE)),
#'   list()
#' )
#'
#' # Standard quotes, use # for commenting
#' sqlParseVariablesImpl("# ?a\n?b",
#'   list(sqlQuoteSpec("'", "'"), sqlQuoteSpec('"', '"')),
#'   list(sqlCommentSpec("#", "\n", FALSE))
#' )
setGeneric("sqlParseVariables", function(con, sql, ...) {
  standardGeneric("sqlParseVariables")
})

#' @export
#' @rdname sqlParseVariables
setMethod("sqlParseVariables", "DBIConnection", function(con, sql, ...) {
  sqlParseVariablesImpl(sql,
    list(
      sqlQuoteSpec('"', "'"),
      sqlQuoteSpec("'", "'")
    ),
    list(
      sqlCommentSpec("/*", "*/", TRUE),
      sqlCommentSpec("--", "\n", FALSE)
    )
  )
})

#' @export
#' @rdname sqlParseVariables
sqlCommentSpec <- function(start, end, endRequired) {
  list(start, end, endRequired)
}

#' @export
#' @rdname sqlParseVariables
sqlQuoteSpec <- function(start, end, escape = "", doubleEscape = TRUE) {
  list(start, end, escape, doubleEscape)
}

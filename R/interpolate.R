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
                          sqlQuoteSpec('"', '"'),
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

#' @export
#' @rdname sqlParseVariables
sqlParseVariablesImpl <- function(sql, quotes, comments) {
  sql_arr <- strsplit(as.character(sql), "", fixed=T)[[1]]
  var_pos_start <- integer()
  var_pos_end <- integer()

  # prepare comments
  for(c in seq_along(comments)) {
    comments[[c]][[1]] <- strsplit(comments[[c]][[1]], "", fixed=T)[[1]]
    comments[[c]][[2]] <- strsplit(comments[[c]][[2]], "", fixed=T)[[1]]
  }
  
  var_chars <- c(LETTERS, tolower(LETTERS), 0:9, "_")
  in_quote <- 0L
  in_comment <- 0L
  i <- 1
  while(i < length(sql_arr)) {
    # only check for variables if neither commented nor quoted
    if (in_quote == 0L && in_comment == 0L) {
      if (sql_arr[[i]] == "?") {
        # consume everything alphanumeric and _ up to end of variable
        var_pos_start <- c(var_pos_start, i)
        repeat {
          i <- i + 1
          if (i > length(sql_arr) || !(sql_arr[[i]] %in% var_chars)) {
            break
          }
        }
        var_pos_end <- c(var_pos_end, i-1)
        next
      }
    }
    # only check for quoted strings when not in commented section
    if (in_comment == 0L) {
      # check all quote defintions, they can only be single characters
      for(q in seq_along(quotes)) {
        if (in_quote == 0L) {
          quote_start_char <- quotes[[q]][[1]]
          if (identical(sql_arr[[i]], quote_start_char))  {
            in_quote <- q
            break
          }
        } else {
          # only check the end of the active quote definition
          # TODO: support end quote escaping (e.g. \")
          quote_end_char <- quotes[[in_quote]][[2]]
          if (identical(sql_arr[[i]], quote_end_char))  {
            in_quote <- 0L
            break
          }
        }
      } 
    } 
    # only check for comments when not in quoted section
    if (in_quote == 0L) {
      # check all comment defintions, they can have arbitrary lengths
      for(c in seq_along(comments)) {
        if (in_comment == 0L) {
          comment_start_arr <- comments[[c]][[1]]
          comment_start_length <- length(comment_start_arr)
          if (identical(sql_arr[i:(i + comment_start_length - 1)], comment_start_arr))  {
            in_comment <- c
            i <- i + comment_start_length
            break
          }
        } else {
          # only check the end of the active comment definition
          comment_end_arr <- comments[[in_comment]][[2]]
          comment_end_length <- length(comment_end_arr)
          if (identical(sql_arr[i:(i + comment_end_length - 1)], comment_end_arr))  {
            in_comment <- 0L
            i <- i + comment_end_length
            break
          }
        }
      } 
    }
    i <- i + 1
  }
  list(start=as.integer(var_pos_start), end=as.integer(var_pos_end))
}

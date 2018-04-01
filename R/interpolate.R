#' @include hidden.R
NULL

#' Safely interpolate values into an SQL string
#'
#' @section Backend authors:
#' If you are implementing an SQL backend with non-ANSI quoting rules, you'll
#' need to implement a method for [sqlParseVariables()]. Failure to
#' do so does not expose you to SQL injection attacks, but will (rarely) result
#' in errors matching supplied and interpolated variables.
#'
#' @param conn A database connection.
#' @param sql A SQL string containing variables to interpolate.
#'   Variables must start with a question mark and can be any valid R
#'   identifier, i.e. it must start with a letter or `.`, and be followed
#'   by a letter, digit, `.` or `_`.
#' @param ...,.dots Named values (for `...`) or a named list (for `.dots`)
#'   to interpolate into a string. All strings
#'   will be first escaped with [dbQuoteString()] prior
#'   to interpolation to protect against SQL injection attacks.
#' @export
#' @examples
#' sql <- "SELECT * FROM X WHERE name = ?name"
#' sqlInterpolate(ANSI(), sql, name = "Hadley")
#'
#' # This is safe because the single quote has been double escaped
#' sqlInterpolate(ANSI(), sql, name = "H'); DROP TABLE--;")
setGeneric("sqlInterpolate",
  def = function(conn, sql, ..., .dots = list()) standardGeneric("sqlInterpolate")
)

#' @rdname hidden_aliases
#' @export
setMethod("sqlInterpolate", signature("DBIConnection"), function(conn, sql, ..., .dots = list()) {
  pos <- sqlParseVariables(conn, sql)

  if (length(pos$start) == 0) {
    return(SQL(sql))
  }

  vars <- substring(sql, pos$start + 1, pos$end)
  positional_vars <- pos$start == pos$end
  if (all(positional_vars) != any(positional_vars)) {
    stop("Can't mix positional (?) and named (?asdf) variables", call. = FALSE)
  }

  values <- c(list(...), .dots)
  if (all(positional_vars)) {
    if (length(vars) != length(values)) {
      stop("Supplied values don't match positional vars to interpolate", call. = FALSE)
    }
    if (any(names(values) != "")) {
      stop("Positional variables don't take named arguments")
    }
  }
  else {
    if (!setequal(vars, names(values))) {
      stop("Supplied values don't match named vars to interpolate", call. = FALSE)
    }
    values <- values[vars]
  }

  safe_values <- vapply(values, function(x) {
    if (is.character(x)) {
      dbQuoteString(conn, x)
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
#' rules, you'll need to implement a method for `sqlParseVariables` that
#' calls `sqlParseVariablesImpl` with the appropriate quote and
#' comment specifications.
#'
#'
#' @param start,end Start and end characters for quotes and comments
#' @param endRequired Is the ending character of a comment required?
#' @param doubleEscape Can quoting characters be escaped by doubling them?
#'   Defaults to `TRUE`.
#' @param escape What character can be used to escape quoting characters?
#'   Defaults to `""`, i.e. nothing.
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
setGeneric("sqlParseVariables",
  def = function(conn, sql, ...) standardGeneric("sqlParseVariables")
)

#' @rdname hidden_aliases
#' @export
setMethod("sqlParseVariables", signature("DBIConnection"), function(conn, sql, ...) {
  sqlParseVariablesImpl(
    sql,
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
  list(start = start, end = end, endRequired = endRequired)
}

#' @export
#' @rdname sqlParseVariables
sqlQuoteSpec <- function(start, end, escape = "", doubleEscape = TRUE) {
  list(start = start, end = end, escape = escape, doubleEscape = doubleEscape)
}

#' @export
#' @rdname sqlParseVariables
#' @param sql SQL to parse (a character string)
#' @param quotes A list of `QuoteSpec` calls defining the quoting
#'   specification.
#' @param comments A list of `CommentSpec` calls defining the commenting
#'   specification.
sqlParseVariablesImpl <- function(sql, quotes, comments) {
  str_to_vec <- function(s) strsplit(s, "", fixed = TRUE)[[1L]]

  sql_arr <- c(str_to_vec(as.character(sql)), " ")

  # characters valid in variable names
  var_chars <- c(LETTERS, letters, 0:9, "_")

  # return values
  var_pos_start <- integer()
  var_pos_end <- integer()

  # internal helper variables
  quote_spec_offset <- 0L
  comment_spec_offset <- 0L
  sql_variable_start <- 0L

  # prepare comments & quotes for quicker comparisions
  for (c in seq_along(comments)) {
    comments[[c]][["start"]] <- str_to_vec(comments[[c]][["start"]])
    comments[[c]][["end"]]   <- str_to_vec(comments[[c]][["end"]])
  }
  for (q in seq_along(quotes)) {
    quotes[[q]][["hasEscape"]] <- nchar(quotes[[q]][["escape"]]) > 0L
  }

  state <- "default"
  i <- 0L
  while (i < length(sql_arr)) {
    i <- i + 1L
    switch(state,

      default = {
        #  variable
        if (sql_arr[[i]] == "?") {
          sql_variable_start <- i
          state <- "variable"
          next
        }
        # starting quoted area
        for (q in seq_along(quotes)) {
          if (identical(sql_arr[[i]], quotes[[q]][["start"]])) {
            quote_spec_offset <- q
            state <- "quote"
            break
          }
        }
        # we can abort here if the state has changed
        if (state != "default") next
        # starting comment
        for (c in seq_along(comments)) {
          comment_start_arr <- comments[[c]][["start"]]
          comment_start_length <- length(comment_start_arr)
          if (identical(sql_arr[i:(i + comment_start_length - 1L)], comment_start_arr)) {
            comment_spec_offset <- c
            i <- i + comment_start_length
            state <- "comment"
            break
          }
        }
      },

      variable = {
        if (!(sql_arr[[i]] %in% var_chars)) {
          # append current variable offsets to return vectors
          var_pos_start <- c(var_pos_start, sql_variable_start)
          # we have already read too much, go back
          i <- i - 1L
          var_pos_end <- c(var_pos_end, i)
          state <- "default"
        }
      },

      quote = {
        # if we see backslash-like escapes, ignore next character
        if (quotes[[quote_spec_offset]][["hasEscape"]] && identical(sql_arr[[i]], quotes[[quote_spec_offset]][[3]])) {
          i <- i + 1L
          next
        }
        # end quoted area
        if (identical(sql_arr[[i]], quotes[[quote_spec_offset]][["end"]])) {
          quote_spec_offset <- 0L
          state <- "default"
        }
      },

      comment = {
        # end commented area
        comment_end_arr <- comments[[comment_spec_offset]][["end"]]
        comment_end_length <- length(comment_end_arr)
        if (identical(sql_arr[i:(i + comment_end_length - 1L)], comment_end_arr)) {
          i <- i + comment_end_length
          comment_spec_offset <- 0L
          state <- "default"
        }
      }
    ) # </switch>
  } # </while>

  if (quote_spec_offset > 0L) {
    stop("Unterminated literal")
  }
  if (comment_spec_offset > 0L && comments[[comment_spec_offset]][["endRequired"]]) {
    stop("Unterminated comment")
  }
  list(start = var_pos_start, end = var_pos_end)
}

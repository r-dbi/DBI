#' Safely interpolate values into an SQL string
#'
#' @description
#' Offers a convenient and safe way to replace named placeholders in a SQL query with
#' constants.
#' This is mostly useful for backend authors where the DBMS doesn't support
#' parametrized queries.
#'
#' The signature of this generic has changed from DBI 0.5 to DBI 0.6,
#' the `_0.5` and `_0.6` functions are included in the *Usage* section below to
#' illustrate this change. See the *Compatibility with DBI 0.5* section for
#' details.
#'
#' @section Backend authors:
#' If you are implementing a SQL backend with non-ANSI quoting rules, you'll
#' need to implement a method for [sqlParseVariables()]. Failure to
#' do so does not expose you to SQL injection attacks, but will (rarely) result
#' in errors matching supplied and interpolated variables.
#'
#' @section Compatibility with DBI 0.5:
#' In DBI 0.5, the `sqlInterpolate()` method had a different signature, see the
#' `_0.5` function in the *Usage* section.
#' In an effort to harmonize the argument names
#' across all DBI methods, the current version of DBI encourages backend authors
#' to define methods with the new `_0.6` signature,
#' which will eventually become the actual signature of the generic.
#' For technical reasons this is not enforced, the generic is defined with
#' signature `...` and performs nonstandard dispatch to support backends that
#' implement this method with either signature.
#'
#' @param conn,_con A database connection.
#' @param sql,`_sql` A SQL string containing variables to interpolate.
#'   Variables must start with a question mark and can be any valid R
#'   identifier, i.e. it must start with a letter or `.`, and be followed
#'   by a letter, digit, `.` or `_`.
#' @param ...,.dots Named values (for `...`) or a named list (for `.dots`)
#'   to interpolate into a string. All strings
#'   will be first escaped with [dbQuoteString()] prior
#'   to interpolation to protect against SQL injection attacks.
#' @examples
#' sql <- "SELECT * FROM X WHERE name = ?name"
#' sqlInterpolate(ANSI(), sql, name = "Hadley")
#'
#' # This is safe because the single quote has been double escaped
#' sqlInterpolate(ANSI(), sql, name = "H'); DROP TABLE--;")
#'
#' # The .dots argument is preferred for programming
#' sqlInterpolate(ANSI(), sql, .dots = list(name = "H'); DROP TABLE--;"))
#' @name sqlInterpolate
sqlInterpolate_0.6 <- function(conn, sql, ..., .dots = list()) {}

#' @name sqlInterpolate
sqlInterpolate_0.5 <- function(`_con`, `_sql`, ...) {}

#' @export
#' @include dot-dispatch.R
#' @name sqlInterpolate
setGeneric(
  "sqlInterpolate",
  make_dispatch_override_generic("sqlInterpolate", function(conn, sql, ..., .dots = list()) {})
)

#' @rdname hidden_aliases
#' @export
setMethod("sqlInterpolate", "DBIConnection", function(conn, sql, ..., .dots = list()) {
  pos <- sqlParseVariables(conn, sql)

  if (length(pos$start) == 0)
    return(SQL(sql))

  vars <- substring(sql, pos$start + 1, pos$end)
  values <- c(list(...), .dots)
  if (!setequal(vars, names(values))) {
    stop("Supplied vars don't match vars to interpolate", call. = FALSE)
  }
  values <- values[vars]

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

#' Parse interpolated variables from SQL
#'
#' @description
#' Offers a convenient and safe way to determine named placeholders in a SQL query.
#' This is mostly useful for backend authors where the DBMS doesn't support
#' parametrized queries.
#'
#' The signature of this generic has changed from DBI 0.5 to DBI 0.6,
#' the `_0.5` and `_0.6` functions are included in the *Usage* section below to
#' illustrate this change. See the *Compatibility with DBI 0.5* section for
#' details.
#'
#' @section Backend authors:
#' If you're implementing a backend that uses non-ANSI quoting or commenting
#' rules, you'll need to implement a method for `sqlParseVariables` that
#' calls `sqlParseVariablesImpl` with the appropriate quote and
#' comment specifications.
#'
#' @section Compatibility with DBI 0.5:
#' In DBI 0.5, the `sqlParseVariables()` method had a different signature, see the
#' `_0.5` function in the *Usage* section.
#' In an effort to harmonize the argument names
#' across all DBI methods, the current version of DBI encourages backend authors
#' to define methods with the new `_0.6` signature,
#' which will eventually become the actual signature of the generic.
#' For technical reasons this is not enforced, the generic is defined with
#' signature `...` and performs nonstandard dispatch to support backends that
#' implement this method with either signature.
#'
#' @param conn,con A database connection.
#' @param sql A SQL string containing variables to search for.
#'   Variables must start with a question mark and can be any valid R
#'   identifier, i.e. it must start with a letter or `.`, and be followed
#'   by a letter, digit, `.` or `_`.
#' @param ... Unused.
#' @keywords internal
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
#' @name sqlParseVariables
sqlParseVariables_0.6 <- function(conn, sql, ...) {}

#' @name sqlParseVariables
sqlParseVariables_0.5 <- function(con, sql, ...) {}

#' @export
#' @include dot-dispatch.R
#' @name sqlParseVariables
setGeneric(
  "sqlParseVariables",
  make_dispatch_override_generic("sqlParseVariables", function(conn, sql, ...) {})
)

#' @rdname hidden_aliases
#' @export
setMethod("sqlParseVariables", "DBIConnection", function(conn, sql, ...) {
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


#' Helper function for sqlParseVariables
#'
#' This function is useful for backend authors who wish to provide
#' a custom implementation of [sqlParseVariables()].
#'
#' @export
#' @param sql SQL to parse (a character vector of length 1)
#' @param quotes A list of `QuoteSpec` calls defining the quoting
#'   specification.
#' @param comments A list of `CommentSpec` calls defining the commenting
#'   specification.
sqlParseVariablesImpl <- function(sql, quotes, comments) {
  sql_arr <- c(strsplit(as.character(sql), "", fixed = TRUE)[[1]], " ")

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
  for(c in seq_along(comments)) {
    comments[[c]][[1]] <- strsplit(comments[[c]][[1]], "", fixed = TRUE)[[1]]
    comments[[c]][[2]] <- strsplit(comments[[c]][[2]], "", fixed = TRUE)[[1]]
  }
  for(q in seq_along(quotes)) {
    quotes[[q]][[5]] <- nchar(quotes[[q]][[3]]) > 0L
  }

  state <- 'default'
  i <- 0
  while(i < length(sql_arr)) {
    i <- i + 1
    switch(state,

      default = {
        # variable?
        if (sql_arr[[i]] == "?") {
          sql_variable_start <- i
          state <- 'variable'
          next
        }
        # starting quoted area?
        for(q in seq_along(quotes)) {
          if (identical(sql_arr[[i]], quotes[[q]][[1]])) {
            quote_spec_offset <- q
            state <- 'quote'
            break
          }
        }
        # we can abort here if the state has changed
        if (state != 'default') next
        # starting comment?
        for(c in seq_along(comments)) {
          comment_start_arr <- comments[[c]][[1]]
          comment_start_length <- length(comment_start_arr)
          if (identical(sql_arr[i:(i + comment_start_length - 1)], comment_start_arr)) {
            comment_spec_offset <- c
            i <- i + comment_start_length
            state <- 'comment'
            break
          }
        }
      },

      variable = {
        if (!(sql_arr[[i]] %in% var_chars)) {
          # make sure variable has at least one character after the '?'
          if (i - sql_variable_start < 2) {
            stop("Length 0 variable")
          }
          # append current variable offsets to return vectors
          var_pos_start <- c(var_pos_start, sql_variable_start)
          var_pos_end <- c(var_pos_end, i - 1)
          # we have already read too much, go back
          i <- i - 1
          state <- 'default'
        }
      },

      quote = {
        # if we see backslash-like escapes, ignore next character
        if (quotes[[quote_spec_offset]][[5]] && identical(sql_arr[[i]], quotes[[quote_spec_offset]][[3]])) {
          i <- i + 1
          next
        }
        # end quoted area?
        if (identical(sql_arr[[i]], quotes[[quote_spec_offset]][[2]])) {
          quote_spec_offset <- 0L
          state <- 'default'
        }
      },

      comment = {
        # end commented area?
        comment_end_arr <- comments[[comment_spec_offset]][[2]]
        comment_end_length <- length(comment_end_arr)
        if (identical(sql_arr[i:(i + comment_end_length - 1)], comment_end_arr)) {
          i <- i + comment_end_length
          comment_spec_offset <- 0L
          state <- 'default'
        }
      }
    ) # </switch>
  } # </while>

  if (quote_spec_offset > 0L) {
    stop("Unterminated literal")
  }
  if (comment_spec_offset > 0L && comments[[comment_spec_offset]][[3]]) {
    stop("Unterminated comment")
  }
  list(start = as.integer(var_pos_start), end = as.integer(var_pos_end))
}

#' @export
#' @rdname sqlParseVariablesImpl
sqlCommentSpec <- function(start, end, endRequired) {
  list(start, end, endRequired)
}

#' @export
#' @rdname sqlParseVariablesImpl
sqlQuoteSpec <- function(start, end, escape = "", doubleEscape = TRUE) {
  list(start, end, escape, doubleEscape)
}

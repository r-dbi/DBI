NULL

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
          i <- i + (comment_end_length - 1)
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

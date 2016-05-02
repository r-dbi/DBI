#' Convert row names back and forth between columns.
#'
#' These functions provide a reasonably automatic way of preserving the row
#' names of data frame during back-and-forth translation to a SQL table.
#' By default, row names will be converted to an explicit column
#' called "row_names", and any query returning a column called "row_names"
#' will have those automatically set as row names.
#'
#' @param df A data frame
#' @param row.names Either \code{TRUE}, \code{FALSE}, \code{NA} or a string.
#'
#'   If \code{TRUE}, always translate row names to a column called "row_names".
#'   If \code{FALSE}, never translate row names. If \code{NA}, translate
#'   rownames only if they're a character vector.
#'
#'   A string is equivalent to \code{TRUE}, but allows you to override the
#'   default name.
#'
#'   For backward compatibility, \code{NULL} is equivalent to \code{FALSE}.
#' @name rownames
#' @examples
#' # If have row names
#' sqlRownamesToColumn(head(mtcars))
#' sqlRownamesToColumn(head(mtcars), FALSE)
#' sqlRownamesToColumn(head(mtcars), "ROWNAMES")
#'
#' # If don't have
#' sqlRownamesToColumn(head(iris))
#' sqlRownamesToColumn(head(iris), TRUE)
#' sqlRownamesToColumn(head(iris), "ROWNAMES")
#'
NULL

#' @export
#' @rdname rownames
sqlRownamesToColumn <- function(df, row.names = NA) {
  name <- guessRowName(df, row.names)
  if (is.null(name)) {
    rownames(df) <- NULL
    return(df)
  }

  rn <- stats::setNames(list(row.names(df)), name)

  df <- c(rn, df)
  class(df) <- "data.frame"
  attr(df, "row.names") <- .set_row_names(length(rn[[1]]))

  df
}

#' @export
#' @rdname rownames
sqlColumnToRownames <- function(df, row.names = NA) {
  name <- guessColName(df, row.names)
  if (is.null(name)) return(df)

  if (!(name %in% names(df))) {
    stop("Column ", name, " not present in output", call. = FALSE)
  }

  row.names(df) <- df[[name]]
  df[[name]] <- NULL

  df
}

guessRowName <- function(df, row.names) {
  if (identical(row.names, TRUE)) {
    "row_names"
  } else if (identical(row.names, FALSE) || is.null(row.names)) {
    NULL
  } else if (identical(row.names, NA)) {
    is_char <- is.character(attr(df, "row.names"))
    if (is_char) {
      "row_names"
    } else {
      NULL
    }
  } else if (is.character(row.names)) {
    row.names[1]
  } else {
    stop("Unknown input")
  }
}

guessColName <- function(df, row.names) {
  if (identical(row.names, TRUE)) {
    "row_names"
  } else if (identical(row.names, FALSE) || is.null(row.names)) {
    NULL
  } else if (identical(row.names, NA)) {
    if ("row_names" %in% names(df)) {
      "row_names"
    } else {
      NULL
    }
  } else if (is.character(row.names)) {
    row.names[1]
  } else {
    stop("Unknown input")
  }
}

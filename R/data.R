#' @include hidden.R
NULL

#' Convert a data frame into form suitable for upload to an SQL database
#'
#' This is a generic method that coerces R objects into vectors suitable for
#' upload to the database. The output will vary a little from method to
#' method depending on whether the main upload device is through a single
#' SQL string or multiple parameterized queries.
#' This method is mostly useful for backend implementers.
#'
#' The default method:
#' \itemize{
#'   \item Converts factors to characters
#'   \item Quotes all strings
#'   \item Converts all columns to strings
#'   \item Replaces NA with NULL
#' }
#'
#' @inheritParams sqlCreateTable
#' @inheritParams rownames
#' @param value A data frame
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' sqlData(con, head(iris))
#' sqlData(con, head(mtcars))
#'
#' dbDisconnect(con)
setGeneric("sqlData",
  def = function(con, value, row.names = NA, ...) standardGeneric("sqlData")
)

#' @rdname hidden_aliases
#' @export
setMethod("sqlData", signature("DBIConnection"), function(con, value, row.names = NA, ...) {
  value <- sqlRownamesToColumn(value, row.names)

  # Convert factors to strings
  is_factor <- vapply(value, is.factor, logical(1))
  value[is_factor] <- lapply(value[is_factor], as.character)

  # Quote all strings
  is_char <- vapply(value, is.character, logical(1))
  value[is_char] <- lapply(value[is_char], function(x) {
    enc2utf8(dbQuoteString(con, x))
  })

  # Convert everything to character and turn NAs into NULL
  value[] <- lapply(value, as.character)
  value[is.na(value)] <- "NULL"

  value
})

# Coercion rules ---------------------------------------------------------------

coerce <- function(sqlvar, from, to) {
  list(from = from, to = to)
}

sqlDate <- function() {
  coerce(
    function(x) as.integer(x),
    function(x) {
      stopifnot(is.integer(x))
      structure(x, class = "Date")
    }
  )
}

sqlDateTime <- function() {
  coerce(
    function(x) as.numeric(x),
    function(x) {
      stopifnot(is.numeric(x))
      structure(x, class = c("POSIXct", "POSIXt"), tzone = "UTC")
    }
  )
}

sqlSerialize <- function() {
  coerce(
    function(x) {
      lapply(x, serialize, connection = NULL)
    },
    function(x) {
      lapply(x, unserialize)
    }
  )
}

sqlBoolean <- function() {
  coerce(
    function(x) as.integer(x),
    function(x) as.logical(x)
  )
}

sqlFactor <- function(levels) {
  coerce(
    function(x) as.integer(x),
    function(x) factor(x, levels = levels)
  )
}

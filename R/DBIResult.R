NULL

#' DBIResult class
#'
#' This virtual class describes the result and state of execution of
#' a DBMS statement (any statement, query or non-query).  The result set
#' keeps track of whether the statement produces output how many rows were
#' affected by the operation, how many rows have been fetched (if statement is
#' a query), whether there are more rows to fetch, etc.
#'
#' @section Implementation notes:
#' Individual drivers are free to allow single or multiple
#' active results per connection.
#'
#' The default show method displays a summary of the query using other
#' DBI generics.
#'
#' @name DBIResult-class
#' @docType class
#' @family DBI classes
#' @family DBIResult generics
#' @export
setClass("DBIResult", contains = c("DBIObject", "VIRTUAL"))

show_result <- function(object) {
  cat("<", is(object)[1], ">\n", sep = "")
  if (!dbIsValid(object)) {
    cat("EXPIRED\n")
  } else {
    cat("  SQL  ", dbGetStatement(object), "\n", sep = "")

    done <- if (dbHasCompleted(object)) "complete" else "incomplete"
    cat("  ROWS Fetched: ", dbGetRowCount(object), " [", done, "]\n", sep = "")
    cat("       Changed: ", dbGetRowsAffected(object), "\n", sep = "")
  }
}

#' @name dbGetInfo
#' @section Implementation notes:
#' The default implementation for `DBIResult objects`
#' constructs such a list from the return values of the corresponding methods,
#' [dbGetStatement()], [dbGetRowCount()],
#' [dbGetRowsAffected()], and [dbHasCompleted()].
NULL

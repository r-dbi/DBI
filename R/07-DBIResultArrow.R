#' DBIResultArrow class
#'
#' @description
#' `r lifecycle::badge('experimental')`
#'
#' This virtual class describes the result and state of execution of
#' a DBMS statement (any statement, query or non-query)
#' for returning data as an Arrow object.
#'
#' @section Implementation notes:
#' Individual drivers are free to allow single or multiple
#' active results per connection.
#'
#' The default show method displays a summary of the query using other
#' DBI generics.
#'
#' @name DBIResultArrow-class
#' @docType class
#' @family DBI classes
#' @family DBIResultArrow generics
#' @export
setClass("DBIResultArrow", contains = c("DBIObject", "VIRTUAL"))

#' @rdname DBIResultArrow-class
#' @export
setClass(
  "DBIResultArrowDefault",
  contains = "DBIResultArrow",
  slots = list(
    result = "DBIResult"
  )
)

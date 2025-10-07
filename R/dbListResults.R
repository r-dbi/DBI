#' A list of all pending results
#'
#' DEPRECATED. DBI currenty supports only one open result set per connection,
#' you need to keep track of the result sets you open if you need this
#' functionality.
#'
#' @inheritParams dbGetQuery
#' @family DBIConnection generics
#' @return a list. If no results are active, an empty list. If only
#'   a single result is active, a list with one element.
#' @export
#' @keywords internal
setGeneric("dbListResults", def = function(conn, ...) {
  standardGeneric("dbListResults")
})

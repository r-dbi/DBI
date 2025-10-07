#' Get DBMS exceptions
#'
#' DEPRECATED. Backends should use R's condition system to signal errors and
#' warnings.
#'
#' @inheritParams dbGetQuery
#' @family DBIConnection generics
#' @return a list with elements `errorNum` (an integer error number) and
#'   `errorMsg` (a character string) describing the last error in the
#'   connection `conn`.
#' @export
#' @keywords internal
setGeneric("dbGetException", def = function(conn, ...) {
  standardGeneric("dbGetException")
})

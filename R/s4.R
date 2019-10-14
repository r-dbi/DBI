#' Define an implementation for a DBI generic
#'
#' This function is intended as a drop-in replacement for [setMethod()].
#' DBI backends should declare their methods with `setDBIMethod()` instead of
#' `setMethod()` to simplify future extensions to the DBI package.
#'
#' To use in a package that creates its documentation with \pkg{roxygen2},
#' set `setMethod` as an alias to `setDBIMethod`.
#' Make sure to define this method in a file that is sourced early on,
#' use `aaa.R` as filename or use `@include` to make sure it appears early
#' in the collate sequence.
#'
#' @inheritParams methods::setMethod
#' @param where,valueClass .
#'
#' @examples
#' if (FALSE) {
#'   # Simple usage
#'   setDBIMethod("dbConnect", signature("KazamDriver"), function(drv, ...) {
#'      ...
#'   })
#'
#'   # Usage in a package maintained by roxygen2
#'   setMethod <- DBI::setDBIMethod
#'   setMethod("dbConnect", signature("KazamDriver"), function(drv, ...) {
#'      ...
#'   })
#' }
#' @export
setDBIMethod <- function(f, signature = character(), definition,
                         where = topenv(parent.frame()), valueClass, sealed) {
  if (!missing(valueClass)) {
    warning('The `valueClass` argument to `setMethod("', f, '")` is obsolete.', call. = FALSE)
  }
  if (!missing(sealed)) {
    warning('The `sealed` argument to `setMethod("', f, '")` is obsolete.', call. = FALSE)
  }
  methods::setMethod(f, signature, definition, where)
}

setMethod <- setDBIMethod

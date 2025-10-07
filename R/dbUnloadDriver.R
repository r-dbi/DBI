#' @description
#' `dbUnloadDriver()` is not implemented for modern backends.
#' @rdname dbDriver
#' @family DBIDriver generics
#' @export
setGeneric("dbUnloadDriver", def = function(drv, ...) {
  standardGeneric("dbUnloadDriver")
})

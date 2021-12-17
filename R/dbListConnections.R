#' List currently open connections
#'
#' DEPRECATED, drivers are no longer required to implement this method.
#' Keep track of the connections you opened if you require a list.
#'
#' @param drv A object inheriting from [DBIDriver-class]
#' @param ... Other arguments passed on to methods.
#' @family DBIDriver generics
#' @keywords internal
#' @export
#' @return a list
setGeneric("dbListConnections",
  def = function(drv, ...) standardGeneric("dbListConnections")
)

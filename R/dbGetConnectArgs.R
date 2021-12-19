#' Get connection arguments
#'
#' Returns the arguments stored in a [DBIConnector-class] object for inspection,
#' optionally evaluating them.
#' This function is called by [dbConnect()]
#' and usually does not need to be called directly.
#'
#' @template methods
#' @templateVar method_name dbGetConnectArgs
#'
#' @param drv A object inheriting from [DBIConnector-class].
#' @param eval Set to `FALSE` to return the functions that generate the argument
#'   instead of evaluating them.
#' @param ... Other arguments passed on to methods. Not otherwise used.
#' @family DBIConnector generics
#' @examples
#' cnr <- new("DBIConnector",
#'   .drv = RSQLite::SQLite(),
#'   .conn_args = list(dbname = ":memory:", password = function() "supersecret")
#' )
#' dbGetConnectArgs(cnr)
#' dbGetConnectArgs(cnr, eval = FALSE)
#' @export
setGeneric("dbGetConnectArgs",
  def = function(drv, eval = TRUE, ...) standardGeneric("dbGetConnectArgs"),
  valueClass = "list"
)

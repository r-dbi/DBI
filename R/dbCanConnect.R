#' Check if a connection to a DBMS can be established
#'
#' Like [dbConnect()], but only checks validity without actually returning
#' a connection object.  The default implementation opens a connection
#' and disconnects on success, but individual backends might implement
#' a lighter-weight check.
#'
#' @template methods
#' @templateVar method_name dbCanConnect
#'
#' @return A scalar logical.  If `FALSE`, the `"reason"` attribute indicates
#'   a reason for failure.
#'
#' @inheritParams dbConnect
#' @family DBIDriver generics
#' @export
#' @examplesIf requireNamespace("RSQLite", quietly = TRUE)
#' # SQLite only needs a path to the database. (Here, ":memory:" is a special
#' # path that creates an in-memory database.) Other database drivers
#' # will require more details (like user, password, host, port, etc.)
#' dbCanConnect(RSQLite::SQLite(), ":memory:")
setGeneric("dbCanConnect",
  def = function(drv, ...) standardGeneric("dbCanConnect"),
  valueClass = "logical"
)

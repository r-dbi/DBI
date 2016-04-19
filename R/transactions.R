#' Begin/commit/rollback SQL transactions
#'
#' Not all database engines implement transaction management, in which case
#' these methods should not be implemented for the specific
#' \code{\linkS4class{DBIConnection}} subclass.
#'
#' @section Side Effects:
#' The current transaction on the connections \code{con} is committed or rolled
#' back.
#'
#' @inheritParams dbDisconnect
#' @return a logical indicating whether the operation succeeded or not.
#' @examples
#' \dontrun{
#' ora <- dbDriver("Oracle")
#' con <- dbConnect(ora)
#' rs <- dbSendQuery(con,
#'       "delete * from PURGE as p where p.wavelength<0.03")
#' if(dbGetInfo(rs, what = "rowsAffected") > 250){
#'   warning("dubious deletion -- rolling back transaction")
#'   dbRollback(con)
#' }
#' }
#' @name transactions
NULL

#' @export
#' @rdname transactions
setGeneric("dbBegin",
  def = function(conn, ...) standardGeneric("dbBegin"),
  valueClass = "logical"
)

#' @export
#' @rdname transactions
setGeneric("dbCommit",
  def = function(conn, ...) standardGeneric("dbCommit"),
  valueClass = "logical"
)

#' @export
#' @rdname transactions
setGeneric("dbRollback",
  def = function(conn, ...) standardGeneric("dbRollback"),
  valueClass = "logical"
)
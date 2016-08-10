#' Begin/commit/rollback SQL transactions
#'
#' Not all database engines implement transaction management, in which case
#' these methods should not be implemented for the specific
#' \code{\linkS4class{DBIConnection}} subclass.
#'
#' @section Side Effects:
#' The current transaction on the connection \code{con} is committed or rolled
#' back.
#'
#' @inheritParams dbDisconnect
#' @return a logical indicating whether the operation succeeded or not.
#' @seealso Self-contained transactions: \code{\link{dbWithTransaction}}
#' @examples
#' \dontrun{
#' ora <- dbDriver("Oracle")
#' con <- dbConnect(ora)
#'
#' rs <- dbSendQuery(con,
#'       "delete * from PURGE as p where p.wavelength<0.03")
#' if (dbGetRowsAffected(rs) > 250) {
#'   warning("dubious deletion -- rolling back transaction")
#'   dbRollback(con)
#' } else {
#'   dbCommit(con)
#' }
#'
#' dbClearResult(rs)
#' dbDisconnect(con)
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

#' Self-contained SQL transactions
#'
#' Given that \link{transactions} are implemented, this function
#' allows you to pass in code that is run in a transaction.
#' The default method of \code{dbWithTransaction} calls \code{\link{dbBegin}}
#' before executing the code,
#' and \code{\link{dbCommit}} after successful completion,
#' or \code{\link{dbRollback}} in case of an error.
#' The advantage is
#' that you don't have to remember to do \code{dbBegin} and \code{dbCommit} or
#' \code{dbRollback} -- that is all taken care of.
#' The special function \code{dbBreak} allows an early exit with rollback,
#' it can be called only inside \code{dbWithTransaction}.
#'
#' @section Side Effects:
#' The transaction in \code{code} on the connection \code{conn} is committed
#' or rolled back. The \code{code} chunk may also modify the local R
#' environment.
#'
#' @param conn A \code{\linkS4class{DBIConnection}} object, as produced by
#'   \code{\link{dbConnect}}.
#' @param code An arbitrary block of R code
#'
#' @return The result of the evaluation of \code{code}
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "cars", head(cars, 3))
#' dbReadTable(con, "cars")   # there are 3 rows
#'
#' ## successful transaction
#' dbWithTransaction(con, {
#'   dbExecute(con, "INSERT INTO cars (speed, dist) VALUES (1, 1);")
#'   dbExecute(con, "INSERT INTO cars (speed, dist) VALUES (2, 2);")
#'   dbExecute(con, "INSERT INTO cars (speed, dist) VALUES (3, 3);")
#' })
#' dbReadTable(con, "cars")   # there are now 6 rows
#'
#' ## failed transaction -- note the missing comma
#' tryCatch(
#'   dbWithTransaction(con, {
#'     dbExecute(con, "INSERT INTO cars (speed, dist) VALUES (1, 1);")
#'     dbExecute(con, "INSERT INTO cars (speed dist) VALUES (2, 2);")
#'     dbExecute(con, "INSERT INTO cars (speed, dist) VALUES (3, 3);")
#'   }),
#'   error = identity
#' )
#' dbReadTable(con, "cars")   # still 6 rows
#'
#' ## early exit, silently
#' dbWithTransaction(con, {
#'   dbExecute(con, "INSERT INTO cars (speed, dist) VALUES (1, 1);")
#'   dbExecute(con, "INSERT INTO cars (speed, dist) VALUES (2, 2);")
#'   if (nrow(dbReadTable(con, "cars")) > 7) dbBreak()
#'   dbExecute(con, "INSERT INTO cars (speed, dist) VALUES (3, 3);")
#' })
#' dbReadTable(con, "cars")   # still 6 rows
#'
#' dbDisconnect(con)
setGeneric("dbWithTransaction",
  def = function(conn, code) standardGeneric("dbWithTransaction")
)

#' @rdname hidden_aliases
#' @export
setMethod("dbWithTransaction", "DBIConnection", function(conn, code) {
  ## needs to be a closure, because it accesses conn
  rollback_because <- function(e) {
    call <- dbRollback(conn)
    if (identical(call, FALSE)) {
      stop(paste("Failed to rollback transaction.",
                 "Tried to roll back because an error",
                 "occurred:", conditionMessage(e)),
           call. = FALSE)
    }
    if (inherits(e, "error")) {
      stop(e)
    }
  }

  ## check if each operation is successful
  call <- dbBegin(conn)
  if (identical(call, FALSE)) {
    stop("Failed to begin transaction", call. = FALSE)
  }
  tryCatch(
    {
      res <- force(code)
      call <- dbCommit(conn)
      if (identical(call, FALSE)) {
        stop("Failed to commit transaction", call. = FALSE)
      }
      res
    },
    dbi_abort = rollback_because,
    error = rollback_because)
})

#' @export
#' @rdname dbWithTransaction
dbBreak <- function() {
  signalCondition(
    structure(
      list(message = "Aborting DBI processing", call = NULL),
      class = c("dbi_abort", "condition")))
  stop("Invalid usage of dbBreak().", call. = FALSE)
}

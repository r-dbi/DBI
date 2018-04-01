#' @include hidden.R
NULL

#' Begin/commit/rollback SQL transactions
#'
#' A transaction encapsulates several SQL statements in an atomic unit.
#' It is initiated with `dbBegin()` and either made persistent with `dbCommit()`
#' or undone with `dbRollback()`.
#' In any case, the DBMS guarantees that either all or none of the statements
#' have a permanent effect.
#' This helps ensuring consistency of write operations to multiple tables.
#'
#' Not all database engines implement transaction management, in which case
#' these methods should not be implemented for the specific
#' [DBIConnection-class] subclass.
#'
#' @template methods
#' @templateVar method_name transactions
#'
#' @inherit DBItest::spec_transaction_begin_commit_rollback return
#' @inheritSection DBItest::spec_transaction_begin_commit_rollback Specification
#'
#' @inheritParams dbGetQuery
#' @seealso Self-contained transactions: [dbWithTransaction()]
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "cash", data.frame(amount = 100))
#' dbWriteTable(con, "account", data.frame(amount = 2000))
#'
#' # All operations are carried out as logical unit:
#' dbBegin(con)
#' withdrawal <- 300
#' dbExecute(con, "UPDATE cash SET amount = amount + ?", list(withdrawal))
#' dbExecute(con, "UPDATE account SET amount = amount - ?", list(withdrawal))
#' dbCommit(con)
#'
#' dbReadTable(con, "cash")
#' dbReadTable(con, "account")
#'
#' # Rolling back after detecting negative value on account:
#' dbBegin(con)
#' withdrawal <- 5000
#' dbExecute(con, "UPDATE cash SET amount = amount + ?", list(withdrawal))
#' dbExecute(con, "UPDATE account SET amount = amount - ?", list(withdrawal))
#' if (dbReadTable(con, "account")$amount >= 0) {
#'   dbCommit(con)
#' } else {
#'   dbRollback(con)
#' }
#'
#' dbReadTable(con, "cash")
#' dbReadTable(con, "account")
#'
#' dbDisconnect(con)
#' @name transactions
NULL

#' @export
#' @rdname transactions
setGeneric("dbBegin",
  def = function(conn, ...) standardGeneric("dbBegin")
)

#' @export
#' @rdname transactions
setGeneric("dbCommit",
  def = function(conn, ...) standardGeneric("dbCommit")
)

#' @export
#' @rdname transactions
setGeneric("dbRollback",
  def = function(conn, ...) standardGeneric("dbRollback")
)

#' Self-contained SQL transactions
#'
#' Given that \link{transactions} are implemented, this function
#' allows you to pass in code that is run in a transaction.
#' The default method of `dbWithTransaction()` calls [dbBegin()]
#' before executing the code,
#' and [dbCommit()] after successful completion,
#' or [dbRollback()] in case of an error.
#' The advantage is
#' that you don't have to remember to do `dbBegin()` and `dbCommit()` or
#' `dbRollback()` -- that is all taken care of.
#' The special function `dbBreak()` allows an early exit with rollback,
#' it can be called only inside `dbWithTransaction()`.
#'
#' DBI implements `dbWithTransaction()`, backends should need to override this
#' generic only if they implement specialized handling.
#'
#' @template methods
#' @templateVar method_name dbWithTransaction
#'
#' @inherit DBItest::spec_transaction_with_transaction return
#' @inheritSection DBItest::spec_transaction_with_transaction Specification
#'
#' @inheritParams dbGetQuery
#' @param code An arbitrary block of R code.
#'
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "cash", data.frame(amount = 100))
#' dbWriteTable(con, "account", data.frame(amount = 2000))
#'
#' # All operations are carried out as logical unit:
#' dbWithTransaction(
#'   con,
#'   {
#'     withdrawal <- 300
#'     dbExecute(con, "UPDATE cash SET amount = amount + ?", list(withdrawal))
#'     dbExecute(con, "UPDATE account SET amount = amount - ?", list(withdrawal))
#'   }
#' )
#'
#' # The code is executed as if in the curent environment:
#' withdrawal
#'
#' # The changes are committed to the database after successful execution:
#' dbReadTable(con, "cash")
#' dbReadTable(con, "account")
#'
#' # Rolling back with dbBreak():
#' dbWithTransaction(
#'   con,
#'   {
#'     withdrawal <- 5000
#'     dbExecute(con, "UPDATE cash SET amount = amount + ?", list(withdrawal))
#'     dbExecute(con, "UPDATE account SET amount = amount - ?", list(withdrawal))
#'     if (dbReadTable(con, "account")$amount < 0) {
#'       dbBreak()
#'     }
#'   }
#' )
#'
#' # These changes were not committed to the database:
#' dbReadTable(con, "cash")
#' dbReadTable(con, "account")
#'
#' dbDisconnect(con)
setGeneric("dbWithTransaction",
  def = function(conn, code, ...) standardGeneric("dbWithTransaction")
)

#' @rdname hidden_aliases
#' @export
setMethod("dbWithTransaction", signature("DBIConnection"), function(conn, code) {
  ## needs to be a closure, because it accesses conn
  rollback_because <- function(e) {
    call <- dbRollback(conn)
    if (identical(call, FALSE)) {
      stop(
        paste(
          "Failed to rollback transaction.",
          "Tried to roll back because an error",
          "occurred:", conditionMessage(e)
        ),
        call. = FALSE
      )
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
    error = rollback_because
  )
})

#' @export
#' @rdname dbWithTransaction
dbBreak <- function() {
  signalCondition(
    structure(
      list(message = "Aborting DBI processing", call = NULL),
      class = c("dbi_abort", "condition")
    )
  )
  stop("Invalid usage of dbBreak().", call. = FALSE)
}

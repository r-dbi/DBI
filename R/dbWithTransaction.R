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
#' @inheritSection DBItest::spec_transaction_with_transaction Failure modes
#' @inheritSection DBItest::spec_transaction_with_transaction Specification
#'
#' @inheritParams dbGetQuery
#' @param code An arbitrary block of R code.
#'
#' @export
#' @examplesIf requireNamespace("RSQLite", quietly = TRUE)
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
#' # The code is executed as if in the current environment:
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

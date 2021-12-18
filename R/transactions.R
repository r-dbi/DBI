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
#' @inheritSection DBItest::spec_transaction_begin_commit_rollback Failure modes
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
NULL

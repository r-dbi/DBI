#' Execute an update statement, query number of rows affected, and then close result set
#'
#' Executes a statement and returns the number of rows affected.
#' `dbExecute()` comes with a default implementation
#' (which should work with most backends) that calls
#' [dbSendStatement()], then [dbGetRowsAffected()], ensuring that
#' the result is always free-d by [dbClearResult()].
#' For passing query parameters, see [dbBind()], in particular
#' the "The command execution flow" section.
#'
#' You can also use `dbExecute()` to call a stored procedure
#' that performs data manipulation or other actions that do not return a result set.
#' To execute a stored procedure that returns a result set,
#' or a data manipulation query that also returns a result set
#' such as `INSERT INTO ... RETURNING ...`, use [dbGetQuery()] instead.
#'
#' @template methods
#' @templateVar method_name dbExecute
#'
#' @section Implementation notes:
#' Subclasses should override this method only if they provide some sort of
#' performance optimization.
#'
#' @inherit DBItest::spec_result_execute return
#' @inheritSection DBItest::spec_result_execute Failure modes
#' @inheritSection DBItest::spec_result_execute Additional arguments
#' @inheritSection DBItest::spec_result_execute Specification
#' @inheritSection DBItest::spec_result_execute Specification for the `immediate` argument
#'
#' @inheritParams dbGetQuery
#' @param statement a character string containing SQL.
#' @family DBIConnection generics
#' @seealso For queries: [dbSendQuery()] and [dbGetQuery()].
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "cars", head(cars, 3))
#' dbReadTable(con, "cars")   # there are 3 rows
#' dbExecute(
#'   con,
#'   "INSERT INTO cars (speed, dist) VALUES (1, 1), (2, 2), (3, 3)"
#' )
#' dbReadTable(con, "cars")   # there are now 6 rows
#'
#' # Pass values using the param argument:
#' dbExecute(
#'   con,
#'   "INSERT INTO cars (speed, dist) VALUES (?, ?)",
#'   params = list(4:7, 5:8)
#' )
#' dbReadTable(con, "cars")   # there are now 10 rows
#'
#' dbDisconnect(con)
setGeneric("dbExecute",
  def = function(conn, statement, ...) standardGeneric("dbExecute")
)

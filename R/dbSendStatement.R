#' Execute a data manipulation statement on a given database connection
#'
#' The `dbSendStatement()` method only submits and synchronously executes the
#' SQL data manipulation statement (e.g., `UPDATE`, `DELETE`,
#' `INSERT INTO`, `DROP TABLE`, ...) to the database engine.  To query
#' the number of affected rows, call [dbGetRowsAffected()] on the
#' returned result object.  You must also call [dbClearResult()] after
#' that. For interactive use, you should almost always prefer
#' [dbExecute()].
#'
#' [dbSendStatement()] comes with a default implementation that simply
#' forwards to [dbSendQuery()], to support backends that only
#' implement the latter.
#'
#' @inheritSection dbBind The command execution flow
#'
#' @template methods
#' @templateVar method_name dbSendStatement
#'
#' @inherit DBItest::spec_result_send_statement return
#' @inheritSection DBItest::spec_result_send_statement Failure modes
#' @inheritSection DBItest::spec_result_send_statement Additional arguments
#' @inheritSection DBItest::spec_result_send_statement Specification
#' @inheritSection DBItest::spec_result_send_statement Specification for the `immediate` argument
#'
#' @inheritParams dbGetQuery
#' @param statement a character string containing SQL.
#'
#' @family DBIConnection generics
#' @seealso For queries: [dbSendQuery()] and [dbGetQuery()].
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "cars", head(cars, 3))
#'
#' rs <- dbSendStatement(
#'   con,
#'   "INSERT INTO cars (speed, dist) VALUES (1, 1), (2, 2), (3, 3)"
#' )
#' dbHasCompleted(rs)
#' dbGetRowsAffected(rs)
#' dbClearResult(rs)
#' dbReadTable(con, "cars")   # there are now 6 rows
#'
#' # Pass one set of values directly using the param argument:
#' rs <- dbSendStatement(
#'   con,
#'   "INSERT INTO cars (speed, dist) VALUES (?, ?)",
#'   params = list(4L, 5L)
#' )
#' dbClearResult(rs)
#'
#' # Pass multiple sets of values using dbBind():
#' rs <- dbSendStatement(
#'   con,
#'   "INSERT INTO cars (speed, dist) VALUES (?, ?)"
#' )
#' dbBind(rs, list(5:6, 6:7))
#' dbBind(rs, list(7L, 8L))
#' dbClearResult(rs)
#' dbReadTable(con, "cars")   # there are now 10 rows
#'
#' dbDisconnect(con)
#' @export
setGeneric("dbSendStatement",
  def = function(conn, statement, ...) standardGeneric("dbSendStatement"),
  valueClass = "DBIResult"
)

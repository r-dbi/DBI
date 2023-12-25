#' Execute a query on a given database connection
#'
#' The `dbSendQuery()` method only submits and synchronously executes the
#' SQL query to the database engine.  It does \emph{not} extract any
#' records --- for that you need to use the [dbFetch()] method, and
#' then you must call [dbClearResult()] when you finish fetching the
#' records you need.
#' For interactive use, you should almost always prefer [dbGetQuery()].
#' Use [dbSendQueryArrow()] or [dbGetQueryArrow()] instead to retrieve the results
#' as an Arrow object.
#'
#' This method is for `SELECT` queries only.  Some backends may
#' support data manipulation queries through this method for compatibility
#' reasons.  However, callers are strongly encouraged to use
#' [dbSendStatement()] for data manipulation statements.
#'
#' The query is submitted to the database server and the DBMS executes it,
#' possibly generating vast amounts of data. Where these data live
#' is driver-specific: some drivers may choose to leave the output on the server
#' and transfer them piecemeal to R, others may transfer all the data to the
#' client -- but not necessarily to the memory that R manages. See individual
#' drivers' `dbSendQuery()` documentation for details.
#'
#' @inheritSection dbBind The data retrieval flow
#'
#' @template methods
#' @templateVar method_name dbSendQuery
#'
#' @inherit DBItest::spec_result_send_query return
#' @inheritSection DBItest::spec_result_send_query Failure modes
#' @inheritSection DBItest::spec_result_send_query Additional arguments
#' @inheritSection DBItest::spec_result_send_query Specification
#' @inheritSection DBItest::spec_result_send_query Specification for the `immediate` argument
#'
#' @inheritParams dbGetQuery
#' @param statement a character string containing SQL.
#'
#' @family DBIConnection generics
#' @family data retrieval generics
#' @seealso For updates: [dbSendStatement()] and [dbExecute()].
#' @export
#' @examplesIf requireNamespace("RSQLite", quietly = TRUE)
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars)
#' rs <- dbSendQuery(con, "SELECT * FROM mtcars WHERE cyl = 4")
#' dbFetch(rs)
#' dbClearResult(rs)
#'
#' # Pass one set of values with the param argument:
#' rs <- dbSendQuery(
#'   con,
#'   "SELECT * FROM mtcars WHERE cyl = ?",
#'   params = list(4L)
#' )
#' dbFetch(rs)
#' dbClearResult(rs)
#'
#' # Pass multiple sets of values with dbBind():
#' rs <- dbSendQuery(con, "SELECT * FROM mtcars WHERE cyl = ?")
#' dbBind(rs, list(6L))
#' dbFetch(rs)
#' dbBind(rs, list(8L))
#' dbFetch(rs)
#' dbClearResult(rs)
#'
#' dbDisconnect(con)
#' @export
setGeneric("dbSendQuery",
  def = function(conn, statement, ...) standardGeneric("dbSendQuery"),
  valueClass = "DBIResult"
)

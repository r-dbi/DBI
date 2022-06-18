#' Send query, retrieve results and then clear result set
#'
#' Returns the result of a query as a data frame.
#' `dbGetQuery()` comes with a default implementation
#' (which should work with most backends) that calls
#' [dbSendQuery()], then [dbFetch()], ensuring that
#' the result is always free-d by [dbClearResult()].
#' For retrieving chunked/paged results or for passing query parameters,
#' see [dbSendQuery()], in particular the "The data retrieval flow" section.
#'
#' This method is for `SELECT` queries only
#' (incl. other SQL statements that return a `SELECT`-alike result,
#'  e. g. execution of a stored procedure or data manipulation queries
#' like `INSERT INTO ... RETURNING ...`).
#' To execute a stored procedure that does not return a result set,
#' use [dbExecute()].
#'
#' Some backends may
#' support data manipulation statements through this method for compatibility
#' reasons.  However, callers are strongly advised to use
#' [dbExecute()] for data manipulation statements.
#'
#' @template methods
#' @templateVar method_name dbGetQuery
#'
#' @inherit DBItest::spec_result_get_query return
#' @inheritSection DBItest::spec_result_get_query Failure modes
#' @inheritSection DBItest::spec_result_get_query Additional arguments
#' @inheritSection DBItest::spec_result_get_query Specification
#' @inheritSection DBItest::spec_result_get_query Specification for the `immediate` argument
#'
#' @section Implementation notes:
#' Subclasses should override this method only if they provide some sort of
#' performance optimization.
#'
#' @param conn A [DBIConnection-class] object, as returned by
#'   [dbConnect()].
#' @param statement a character string containing SQL.
#' @param ... Other parameters passed on to methods.
#' @family DBIConnection generics
#' @seealso For updates: [dbSendStatement()] and [dbExecute()].
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars)
#' dbGetQuery(con, "SELECT * FROM mtcars")
#' dbGetQuery(con, "SELECT * FROM mtcars", n = 6)
#'
#' # Pass values using the param argument:
#' # (This query runs eight times, once for each different
#' # parameter. The resulting rows are combined into a single
#' # data frame.)
#' dbGetQuery(
#'   con,
#'   "SELECT COUNT(*) FROM mtcars WHERE cyl = ?",
#'   params = list(1:8)
#' )
#'
#' dbDisconnect(con)
setGeneric("dbGetQuery",
  def = function(conn, statement, ...) standardGeneric("dbGetQuery")
)

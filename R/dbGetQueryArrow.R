#' Retrieve results from a query as an Arrow object
#'
#' @description
#' `r lifecycle::badge('experimental')`
#'
#' Returns the result of a query as an Arrow object.
#' `dbGetQueryArrow()` comes with a default implementation
#' (which should work with most backends) that calls
#' [dbSendQueryArrow()], then [dbFetchArrow()], ensuring that
#' the result is always freed by [dbClearResult()].
#' For passing query parameters,
#' see [dbSendQueryArrow()], in particular
#' the "The data retrieval flow for Arrow streams" section.
#' For retrieving results as a data frame, see [dbGetQuery()].
#'
#' @details
#' This method is for `SELECT` queries only
#' (incl. other SQL statements that return a `SELECT`-alike result,
#' e.g., execution of a stored procedure or data manipulation queries
#' like `INSERT INTO ... RETURNING ...`).
#' To execute a stored procedure that does not return a result set,
#' use [dbExecute()].
#'
#' Some backends may
#' support data manipulation statements through this method.
#' However, callers are strongly advised to use
#' [dbExecute()] for data manipulation statements.
#'
#' @template methods
#' @templateVar method_name dbGetQueryArrow
#'
#' @inherit DBItest::spec_arrow_get_query_arrow return
#' @inheritSection DBItest::spec_arrow_get_query_arrow Failure modes
#' @inheritSection DBItest::spec_arrow_get_query_arrow Additional arguments
#' @inheritSection DBItest::spec_arrow_get_query_arrow Specification for the `immediate` argument
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
#' @family data retrieval generics
#' @seealso For updates: [dbSendStatement()] and [dbExecute()].
#' @export
#' @examplesIf requireNamespace("RSQLite", quietly = TRUE) && requireNamespace("nanoarrow", quietly = TRUE)
#' # Retrieve data as arrow table
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars)
#' dbGetQueryArrow(con, "SELECT * FROM mtcars")
#'
#' dbDisconnect(con)
setGeneric("dbGetQueryArrow",
  def = function(conn, statement, ...) standardGeneric("dbGetQueryArrow")
)

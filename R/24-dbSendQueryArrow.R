#' Execute a query on a given database connection for retrieval via Arrow
#'
#' @description
#' `r lifecycle::badge('experimental')`
#'
#' The `dbSendQueryArrow()` method only submits and synchronously executes the
#' SQL query to the database engine.
#' It does \emph{not} extract any
#' records --- for that you need to use the [dbFetchArrow()] method, and
#' then you must call [dbClearResult()] when you finish fetching the
#' records you need.
#' For interactive use, you should almost always prefer [dbGetQueryArrow()].
#' Use [dbSendQuery()] or [dbGetQuery()] instead to retrieve the results
#' as a data frame.
#'
#' @details
#' This method is for `SELECT` queries only.  Some backends may
#' support data manipulation queries through this method for compatibility
#' reasons.  However, callers are strongly encouraged to use
#' [dbSendStatement()] for data manipulation statements.
#'
#' @inheritSection dbBindArrow The data retrieval flow for Arrow streams
#'
#' @template methods
#' @templateVar method_name dbSendQueryArrow
#'
#' @inherit DBItest::spec_arrow_send_query_arrow return
#' @inheritSection DBItest::spec_arrow_send_query_arrow Failure modes
#' @inheritSection DBItest::spec_arrow_send_query_arrow Additional arguments
#' @inheritSection DBItest::spec_arrow_send_query_arrow Specification
#' @inheritSection DBItest::spec_arrow_send_query_arrow Specification for the `immediate` argument
#'
#' @inheritParams dbGetQueryArrow
#' @param statement a character string containing SQL.
#'
#' @family DBIConnection generics
#' @family data retrieval generics
#' @seealso For updates: [dbSendStatement()] and [dbExecute()].
#' @export
#' @examplesIf requireNamespace("RSQLite", quietly = TRUE) && requireNamespace("nanoarrow", quietly = TRUE)
#' # Retrieve data as arrow table
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars)
#' rs <- dbSendQueryArrow(con, "SELECT * FROM mtcars WHERE cyl = 4")
#' dbFetchArrow(rs)
#' dbClearResult(rs)
#'
#' dbDisconnect(con)
setGeneric(
  "dbSendQueryArrow",
  def = function(conn, statement, ...) {
    require_arrow()
    standardGeneric("dbSendQueryArrow")
  },
  valueClass = "DBIResultArrow"
)

#' Bind values using an array stream
#'
#' For parametrized or prepared statements,
#' the [dbSendQuery()], [dbSendQueryArrow()], and [dbSendStatement()] functions
#' can be called with statements that contain placeholders for values.
#' The `dbBindArrow()` function binds these placeholders to actual values,
#' and is intended to be called on the result set
#' before calling [dbFetch()] or [dbFetchArrow()].
#' Compared to [dbBind()], the actual values come from a stream
#' created by [nanoarrow::as_nanoarrow_array_stream()].
#'
#' \pkg{DBI} supports parametrized (or prepared) queries and statements
#' via the `dbBindArrow()` generic.
#' Parametrized queries are different from normal queries
#' in that they allow an arbitrary number of placeholders,
#' which are later substituted by actual values.
#' Parametrized queries (and statements) serve two purposes:
#'
#' - The same query can be executed more than once with different values.
#'   The DBMS may cache intermediate information for the query,
#'   such as the execution plan,
#'   and execute it faster.
#' - Separation of query syntax and parameters protects against SQL injection.
#'
#' The placeholder format is currently not specified by \pkg{DBI};
#' in the future, a uniform placeholder syntax may be supported.
#' Consult the backend documentation for the supported formats.
#' For automated testing, backend authors specify the placeholder syntax with
#' the `placeholder_pattern` tweak.
#' Known examples are:
#'
#' - `?` (positional matching in order of appearance) in \pkg{RMySQL} and \pkg{RSQLite}
#' - `$1` (positional matching by index) in \pkg{RPostgres} and \pkg{RSQLite}
#' - `:name` and `$name` (named matching) in \pkg{RSQLite}
#'
#' @section The data retrieval flow:
#'
#' This section gives a complete overview over the flow
#' for the execution of queries that return tabular data.
#'
#' Most of this flow, except repeated calling of [dbBindArrow()],
#' is implemented by [dbGetQueryArrow()], which should be sufficient
#' unless you want to access the results in a paged way
#' or you have a parameterized query.
#' This flow requires an active connection established by [dbConnect()].
#' See also `vignette("dbi-advanced")` for a walkthrough.
#'
#' 1. Use [dbSendQueryArrow()] to create a result set object of class
#'    [DBIResultArrow-class].
#' 1. Optionally, bind query parameters with [dbBindArrow()].
#'    This is required only if the query contains placeholders
#'    such as `?` or `$1`, depending on the database backend.
#' 1. Use [dbFetchArrow()] to get a data stream.
#' 1. Repeat the last two steps as necessary.
#' 1. Use [dbClearResult()] to clean up the result set object.
#'    This step is mandatory even if no rows have been fetched
#'    or if an error has occurred during the processing.
#'    It is good practice to use [on.exit()] or [withr::defer()]
#'    to ensure that this step is always executed.
#'
#' Alternatively, [dbSendQuery()] and [dbFetch()] can be used
#' instead of [dbSendQueryArrow()] and [dbFetchArrow()].
#'
#' @section The command execution flow:
#'
#' This section gives a complete overview over the flow
#' for the execution of SQL statements that have side effects
#' such as stored procedures, inserting or deleting data,
#' or setting database or connection options.
#' Most of this flow, except repeated calling of [dbBindArrow()],
#' is implemented by [dbExecute()], which should be sufficient
#' for non-parameterized queries.
#' This flow requires an active connection established by [dbConnect()].
#' See also `vignette("dbi-advanced")` for a walkthrough.
#'
#' 1. Use [dbSendStatement()] to create a result set object of class
#'    [DBIResult-class].
#'    For some queries you need to pass `immediate = TRUE`.
#' 1. Optionally, bind query parameters with [dbBindArrow()].
#'    This is required only if the query contains placeholders
#'    such as `?` or `$1`, depending on the database backend.
#' 1. Optionally, use [dbGetRowsAffected()] to retrieve the number
#'    of rows affected by the query.
#' 1. Use [dbClearResult()] to clean up the result set object.
#'    This step is mandatory even if no rows have been fetched
#'    or if an error has occurred during the processing.
#'    It is good practice to use [on.exit()] or [withr::defer()]
#'    to ensure that this step is always executed.
#'
#' @template methods
#' @templateVar method_name dbBindArrow
#'
#' @inherit DBItest::spec_meta_bind return
#' @inheritSection DBItest::spec_meta_bind Failure modes
#' @inheritSection DBItest::spec_meta_bind Specification
#'
#' @inheritParams dbClearResult
#' @param params Parameters as a nanoarrow stream.
#' @family DBIResult generics
#' @family data retrieval generics
#' @family command execution generics
#' @export
#' @examplesIf packageVersion("nanoarrow") >= "0.1.0.2"
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "iris", iris)
#'
#' # Using the same query for different values
#' iris_result <- dbSendQueryArrow(con, "SELECT * FROM iris WHERE [Petal.Width] > ?")
#' dbBindArrow(
#'   iris_result,
#'   nanoarrow::as_nanoarrow_array_stream(data.frame(2.3, fix.empty.names = FALSE))
#' )
#' as.data.frame(dbFetchArrow(iris_result))
#' dbBindArrow(
#'   iris_result,
#'   nanoarrow::as_nanoarrow_array_stream(data.frame(3, fix.empty.names = FALSE))
#' )
#' as.data.frame(dbFetchArrow(iris_result))
#' dbClearResult(iris_result)
#'
#' # Executing the same statement with different values at once
#' iris_result <- dbSendStatement(con, "DELETE FROM iris WHERE [Species] = $species")
#' dbBindArrow(iris_result, nanoarrow::as_nanoarrow_array_stream(data.frame(
#'   species = c("setosa", "versicolor", "unknown")
#' )))
#' dbGetRowsAffected(iris_result)
#' dbClearResult(iris_result)
#'
#' nrow(dbReadTable(con, "iris"))
#'
#' dbDisconnect(con)
setGeneric("dbBindArrow",
  def = function(res, params, ...) standardGeneric("dbBindArrow")
)

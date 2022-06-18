#' Bind values to a parameterized/prepared statement
#'
#' For parametrized or prepared statements,
#' the [dbSendQuery()] and [dbSendStatement()] functions can be called with
#' statements that contain placeholders for values. The `dbBind()` function
#' binds these placeholders
#' to actual values, and is intended to be called on the result set
#' before calling [dbFetch()] or [dbGetRowsAffected()].
#'
#' \pkg{DBI} supports parametrized (or prepared) queries and statements
#' via the `dbBind()` generic.
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
#' Most of this flow, except calling [dbBind()],
#' is implemented by [dbGetQuery()], which should be sufficient
#' unless you want to access the results in a paged way
#' or you have a parameterized query.
#' This flow requires an active connection established by [dbConnect()].
#' See also `vignette("dbi-advanced")` for a walkthrough.
#'
#' 1. Use [dbSendQuery()] to create a result set object of class
#'    [DBIResult-class].
#' 1. Optionally, bind query parameters with [dbBind()].
#'    This is required only if the query contains placeholders
#'    such as `?` or `$1`, depending on the database backend.
#' 1. Optionally, use [dbColumnInfo()] to retrieve the structure of the result set
#'    without retrieving actual data.
#' 1. Use [dbFetch()] to get the entire result set, a page of results,
#'    or the remaining rows.
#'    Fetching zero rows is also possible to retrieeve the structure of the result set
#'    as a data frame.
#'    This step can be called multiple times.
#'    Only forward paging is supported, you need to cache previous pages
#'    if you need to navigate backwards.
#' 1. Use [dbHasCompleted()] to tell when you're done.
#'    This method returns `TRUE` if no more rows are available for fetching.
#' 1. Use [dbClearResult()] to clean up the result set object.
#'    This step is mandatory even if no rows have been fetched
#'    or if an error has occured during the processing.
#'    It is good practice to use [on.exit()] or [withr::defer()]
#'    to ensure that this step is always executed.
#'
#' @section The command execution flow:
#'
#' This section gives a complete overview over the flow
#' for the execution of SQL statements that have side effects
#' such as stored procedures, inserting or deleting data,
# 'or setting database or connection options.
#' Most of this flow, except calling [dbBind()],
#' is implemented by [dbExecute()], which should be sufficient
#' for non-parameterized queries.
#' This flow requires an active connection established by [dbConnect()].
#' See also `vignette("dbi-advanced")` for a walkthrough.
#'
#' 1. Use [dbSendStatement()] to create a result set object of class
#'    [DBIResult-class].
#'    For some queries you need to pass `immediate = TRUE`.
#' 1. Optionally, bind query parameters with [dbBind()].
#'    This is required only if the query contains placeholders
#'    such as `?` or `$1`, depending on the database backend.
#' 1. Optionally, use [dbGetRowsAffected()] to retrieve the number
#'    of rows affected by the query.
#' 1. Use [dbClearResult()] to clean up the result set object.
#'    This step is mandatory even if no rows have been fetched
#'    or if an error has occured during the processing.
#'    It is good practice to use [on.exit()] or [withr::defer()]
#'    to ensure that this step is always executed.
#'
#' @template methods
#' @templateVar method_name dbBind
#'
#' @inherit DBItest::spec_meta_bind return
#' @inheritSection DBItest::spec_meta_bind Failure modes
#' @inheritSection DBItest::spec_meta_bind Specification
#'
#' @inheritParams dbClearResult
#' @param params A list of bindings, named or unnamed.
#' @family DBIResult generics
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "iris", iris)
#'
#' # Using the same query for different values
#' iris_result <- dbSendQuery(con, "SELECT * FROM iris WHERE [Petal.Width] > ?")
#' dbBind(iris_result, list(2.3))
#' dbFetch(iris_result)
#' dbBind(iris_result, list(3))
#' dbFetch(iris_result)
#' dbClearResult(iris_result)
#'
#' # Executing the same statement with different values at once
#' iris_result <- dbSendStatement(con, "DELETE FROM iris WHERE [Species] = $species")
#' dbBind(iris_result, list(species = c("setosa", "versicolor", "unknown")))
#' dbGetRowsAffected(iris_result)
#' dbClearResult(iris_result)
#'
#' nrow(dbReadTable(con, "iris"))
#'
#' dbDisconnect(con)
setGeneric("dbBind",
  def = function(res, params, ...) standardGeneric("dbBind")
)

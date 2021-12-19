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

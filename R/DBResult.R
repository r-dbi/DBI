#' @include hidden.R
NULL

#' DBIResult class
#'
#' This virtual class describes the result and state of execution of
#' a DBMS statement (any statement, query or non-query).  The result set
#' keeps track of whether the statement produces output how many rows were
#' affected by the operation, how many rows have been fetched (if statement is
#' a query), whether there are more rows to fetch, etc.
#'
#' @section Implementation notes:
#' Individual drivers are free to allow single or multiple
#' active results per connection.
#'
#' The default show method displays a summary of the query using other
#' DBI generics.
#'
#' @name DBIResult-class
#' @docType class
#' @family DBI classes
#' @family DBIResult generics
#' @export
#' @include DBObject.R
setClass("DBIResult", contains = c("DBIObject", "VIRTUAL"))

#' @rdname hidden_aliases
#' @param object Object to display
#' @export
setMethod("show", signature("DBIResult"), function(object) {
  # to protect drivers that fail to implement the required methods (e.g.,
  # RPostgreSQL)
  tryCatch(
    show_result(object),
    error = function(e) NULL
  )
  invisible(NULL)
})

show_result <- function(object) {
  cat("<", is(object)[1], ">\n", sep = "")
  if (!dbIsValid(object)) {
    cat("EXPIRED\n")
  } else {
    cat("  SQL  ", dbGetStatement(object), "\n", sep = "")

    done <- if (dbHasCompleted(object)) "complete" else "incomplete"
    cat("  ROWS Fetched: ", dbGetRowCount(object), " [", done, "]\n", sep = "")
    cat("       Changed: ", dbGetRowsAffected(object), "\n", sep = "")
  }
}

#' Fetch records from a previously executed query
#'
#' Fetch the next `n` elements (rows) from the result set and return them
#' as a data.frame.
#'
#' `fetch()` is provided for compatibility with older DBI clients - for all
#' new code you are strongly encouraged to use `dbFetch()`. The default
#' implementation for `dbFetch()` calls `fetch()` so that it is compatible with
#' existing code. Modern backends should implement for `dbFetch()` only.
#'
#' @template methods
#' @templateVar method_name dbFetch
#'
#' @inherit DBItest::spec_result_fetch return
#' @inheritSection DBItest::spec_result_fetch Specification
#' @inheritSection DBItest::spec_result_roundtrip Specification
#'
#' @param res An object inheriting from [DBIResult-class], created by
#'   [dbSendQuery()].
#' @param n maximum number of records to retrieve per fetch. Use `n = -1`
#'   or `n = Inf`
#'   to retrieve all pending records.  Some implementations may recognize other
#'   special values.
#' @param ... Other arguments passed on to methods.
#' @seealso Close the result set with [dbClearResult()] as soon as you
#'   finish retrieving the records you want.
#' @family DBIResult generics
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars)
#'
#' # Fetch all results
#' rs <- dbSendQuery(con, "SELECT * FROM mtcars WHERE cyl = 4")
#' dbFetch(rs)
#' dbClearResult(rs)
#'
#' # Fetch in chunks
#' rs <- dbSendQuery(con, "SELECT * FROM mtcars")
#' while (!dbHasCompleted(rs)) {
#'   chunk <- dbFetch(rs, 10)
#'   print(nrow(chunk))
#' }
#'
#' dbClearResult(rs)
#' dbDisconnect(con)
#' @export
setGeneric("dbFetch",
  def = function(res, n = -1, ...) standardGeneric("dbFetch"),
  valueClass = "data.frame"
)

#' @rdname hidden_aliases
#' @export
setMethod("dbFetch", signature("DBIResult"), function(res, n = -1, ...) {
  fetch(res, n = n, ...)
})

#' @rdname dbFetch
#' @export
setGeneric("fetch",
  def = function(res, n = -1, ...) standardGeneric("fetch"),
  valueClass = "data.frame"
)

#' Clear a result set
#'
#' Frees all resources (local and remote) associated with a result set.  In some
#' cases (e.g., very large result sets) this can be a critical step to avoid
#' exhausting resources (memory, file descriptors, etc.)
#'
#' @template methods
#' @templateVar method_name dbClearResult
#'
#' @inherit DBItest::spec_result_clear_result return
#' @inheritSection DBItest::spec_result_clear_result Specification
#'
#' @param res An object inheriting from [DBIResult-class].
#' @param ... Other arguments passed on to methods.
#' @family DBIResult generics
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' rs <- dbSendQuery(con, "SELECT 1")
#' print(dbFetch(rs))
#'
#' dbClearResult(rs)
#' dbDisconnect(con)
setGeneric("dbClearResult",
  def = function(res, ...) standardGeneric("dbClearResult")
)

#' Information about result types
#'
#' Produces a data.frame that describes the output of a query. The data.frame
#' should have as many rows as there are output fields in the result set, and
#' each column in the data.frame describes an aspect of the result set
#' field (field name, type, etc.)
#'
#' @inheritParams dbClearResult
#'
#' @inherit DBItest::spec_meta_column_info return
#' @inheritSection DBItest::spec_meta_column_info Specification
#'
#' @family DBIResult generics
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' rs <- dbSendQuery(con, "SELECT 1 AS a, 2 AS b")
#' dbColumnInfo(rs)
#' dbFetch(rs)
#'
#' dbClearResult(rs)
#' dbDisconnect(con)
setGeneric("dbColumnInfo",
  def = function(res, ...) standardGeneric("dbColumnInfo"),
  valueClass = "data.frame"
)

#' Get the statement associated with a result set
#'
#' Returns the statement that was passed to [dbSendQuery()]
#' or [dbSendStatement()].
#'
#' @template methods
#' @templateVar method_name dbGetStatement
#'
#' @inherit DBItest::spec_meta_get_statement return
#'
#' @inheritParams dbClearResult
#' @family DBIResult generics
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars)
#' rs <- dbSendQuery(con, "SELECT * FROM mtcars")
#' dbGetStatement(rs)
#'
#' dbClearResult(rs)
#' dbDisconnect(con)
setGeneric("dbGetStatement",
  def = function(res, ...) standardGeneric("dbGetStatement"),
  valueClass = "character"
)


#' Completion status
#'
#' This method returns if the operation has completed.
#' A `SELECT` query is completed if all rows have been fetched.
#' A data manipulation statement is always completed.
#'
#' @template methods
#' @templateVar method_name dbHasCompleted
#'
#' @inherit DBItest::spec_meta_has_completed return
#' @inheritSection DBItest::spec_meta_has_completed Specification
#'
#' @inheritParams dbClearResult
#' @family DBIResult generics
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars)
#' rs <- dbSendQuery(con, "SELECT * FROM mtcars")
#'
#' dbHasCompleted(rs)
#' ret1 <- dbFetch(rs, 10)
#' dbHasCompleted(rs)
#' ret2 <- dbFetch(rs)
#' dbHasCompleted(rs)
#'
#' dbClearResult(rs)
#' dbDisconnect(con)
setGeneric("dbHasCompleted",
  def = function(res, ...) standardGeneric("dbHasCompleted"),
  valueClass = "logical"
)


#' The number of rows affected
#'
#' This method returns the number of rows that were added, deleted, or updated
#' by a data manipulation statement.
#'
#' @template methods
#' @templateVar method_name dbGetRowsAffected
#'
#' @inherit DBItest::spec_meta_get_rows_affected return
#'
#' @inheritParams dbClearResult
#' @family DBIResult generics
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars)
#' rs <- dbSendStatement(con, "DELETE FROM mtcars")
#' dbGetRowsAffected(rs)
#' nrow(mtcars)
#'
#' dbClearResult(rs)
#' dbDisconnect(con)
setGeneric("dbGetRowsAffected",
  def = function(res, ...) standardGeneric("dbGetRowsAffected"),
  valueClass = "numeric"
)


#' The number of rows fetched so far
#'
#' Returns the total number of rows actually fetched with calls to [dbFetch()]
#' for this result set.
#'
#' @template methods
#' @templateVar method_name dbGetRowCount
#'
#' @inherit DBItest::spec_meta_get_row_count return
#'
#' @inheritParams dbClearResult
#' @family DBIResult generics
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars)
#' rs <- dbSendQuery(con, "SELECT * FROM mtcars")
#'
#' dbGetRowCount(rs)
#' ret1 <- dbFetch(rs, 10)
#' dbGetRowCount(rs)
#' ret2 <- dbFetch(rs)
#' dbGetRowCount(rs)
#' nrow(ret1) + nrow(ret2)
#'
#' dbClearResult(rs)
#' dbDisconnect(con)
setGeneric("dbGetRowCount",
  def = function(res, ...) standardGeneric("dbGetRowCount"),
  valueClass = "numeric"
)


#' @name dbGetInfo
#' @section Implementation notes:
#' The default implementation for `DBIResult objects`
#' constructs such a list from the return values of the corresponding methods,
#' [dbGetStatement()], [dbGetRowCount()],
#' [dbGetRowsAffected()], and [dbHasCompleted()].
NULL
#' @rdname hidden_aliases
setMethod("dbGetInfo", signature("DBIResult"), function(dbObj, ...) {
  list(
    statement = dbGetStatement(dbObj),
    row.count = dbGetRowCount(dbObj),
    rows.affected = dbGetRowsAffected(dbObj),
    has.completed = dbHasCompleted(dbObj)
  )
})


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

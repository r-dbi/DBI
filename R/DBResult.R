#' DBIResult class.
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
#' @export
#' @include DBObject.R
setClass("DBIResult", representation("DBIObject", "VIRTUAL"))

#' @param object Object to display
#' @rdname DBIResult-class
#' @export
setMethod("show", "DBIResult", function(object) {
  # to protect drivers that fail to implement the required methods (e.g.,
  # RPostgreSQL)
  tryCatch(
    show_result(object),
    error = function(e) NULL)
  invisible(NULL)
})

show_result <- function(object) {
  cat("<", is(object)[1], ">\n", sep = "")
  if(!dbIsValid(object)){
    cat("EXPIRED\n")
  } else {
    cat("  SQL  ", dbGetStatement(object), "\n", sep = "")

    done <- if (dbHasCompleted(object)) "complete" else "incomplete"
    cat("  ROWS Fetched: ", dbGetRowCount(object), " [", done, "]\n", sep = "")
    cat("       Changed: ", dbGetRowsAffected(object), "\n", sep = "")
  }
}

#' Fetch records from a previously executed query.
#'
#' Fetch the next \code{n} elements (rows) from the result set and return them
#' as a data.frame.
#'
#' \code{fetch} is provided for compatibility with older DBI clients - for all
#' new code you are strongly encouraged to use \code{dbFetch}. The default
#' method for \code{dbFetch} calls \code{fetch} so that it is compatible with
#' existing code. Implementors should provide methods for both \code{fetch} and
#' \code{dbFetch} until \code{fetch} is deprecated in 2015.
#'
#' @aliases dbFetch,DBIResult-method
#' @param res An object inheriting from \code{\linkS4class{DBIResult}}.
#' @param n maximum number of records to retrieve per fetch. Use \code{n = -1}
#'   to retrieve all pending records.  Some implementations may recognize other
#'   special values.
#' @param ... Other arguments passed on to methods.
#' @return a data.frame with as many rows as records were fetched and as many
#'   columns as fields in the result set.
#' @seealso close the result set with \code{\link{dbClearResult}} as soon as you
#'   finish retrieving the records you want.
#' @family DBIResult generics
#' @examples
#' if (!require("RSQLite")) {
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#' dbWriteTable(con, "mtcars", mtcars)
#'
#' # Fetch all results
#' res <- dbSendQuery(con, "SELECT * FROM mtcars WHERE cyl = 4")
#' dbFetch(res)
#' dbClearResult(res)
#'
#' # Fetch in chunks
#' res <- dbSendQuery(con, "SELECT * FROM mtcars")
#' while (!dbHasCompleted(res)) {
#'   chunk <- fetch(res, 10)
#'   print(nrow(chunk))
#' }
#' dbClearResult(res)
#' dbDisconnect(con)
#' }
#' @export
setGeneric("dbFetch",
  def = function(res, n = -1, ...) standardGeneric("dbFetch"),
  valueClass = "data.frame"
)

setMethod("dbFetch", "DBIResult", function(res, n = -1, ...) {
  fetch(res, n = n, ...)
})

#' @rdname dbFetch
#' @export
setGeneric("fetch",
  def = function(res, n = -1, ...) standardGeneric("fetch"),
  valueClass = "data.frame"
)

#' Clear a result set.
#'
#' Frees all resources (local and remote) associated with a result set.  It some
#' cases (e.g., very large result sets) this can be a critical step to avoid
#' exhausting resources (memory, file descriptors, etc.)
#'
#' @param res An object inheriting from \code{\linkS4class{DBIResult}}.
#' @param ... Other arguments passed on to methods.
#' @return a logical indicating whether clearing the
#'   result set was successful or not.
#' @family DBIResult generics
#' @export
setGeneric("dbClearResult",
  def = function(res, ...) standardGeneric("dbClearResult"),
  valueClass = "logical"
)

#' Information about result types.
#'
#' Produces a data.frame that describes the output of a query. The data.frame
#' should have as many rows as there are output fields in the result set, and
#' each column in the data.frame should describe an aspect of the result set
#' field (field name, type, etc.)
#'
#' @inheritParams dbClearResult
#' @return A data.frame with one row per output field in \code{res}. Methods
#'   MUST include \code{name}, \code{field.type} (the SQL type),
#'   and \code{data.type} (the R data type) columns, and MAY contain other
#'   database specific information like scale and precision or whether the
#'   field can store \code{NULL}s.
#' @family DBIResult generics
#' @export
setGeneric("dbColumnInfo",
  def = function(res, ...) standardGeneric("dbColumnInfo"),
  valueClass = "data.frame"
)

#' Get the statement associated with a result set
#'
#' Returns the statement that was passed to \code{\link{dbSendQuery}}.
#'
#' @inheritParams dbClearResult
#' @aliases dbGetStatement,DBIResult-method
#' @return a character vector
#' @family DBIResult generics
#' @export
setGeneric("dbGetStatement",
  def = function(res, ...) standardGeneric("dbGetStatement"),
  valueClass = "character"
)


#' Completion status
#'
#' This method returns if the operation has completed.
#'
#' @inheritParams dbClearResult
#' @aliases dbHasCompleted,DBIResult-method
#' @return a logical vector of length 1
#' @family DBIResult generics
#' @export
setGeneric("dbHasCompleted",
  def = function(res, ...) standardGeneric("dbHasCompleted"),
  valueClass = "logical"
)


#' The number of rows affected
#'
#' This function returns the number of rows that were added, deleted, or updated
#' by data modifying query. For a selection query, this function returns 0.
#'
#' @inheritParams dbClearResult
#' @aliases dbGetRowsAffected,DBIResult-method
#' @return a numeric vector of length 1
#' @family DBIResult generics
#' @export
setGeneric("dbGetRowsAffected",
  def = function(res, ...) standardGeneric("dbGetRowsAffected"),
  valueClass = "numeric"
)


#' The number of rows fetched so far
#'
#' This value is increased by calls to \code{\link{dbFetch}}. For a data
#' modifying query, the return value is 0.
#'
#' @inheritParams dbClearResult
#' @aliases dbGetRowCount,DBIResult-method
#' @return a numeric vector of length 1
#' @family DBIResult generics
#' @export
setGeneric("dbGetRowCount",
  def = function(res, ...) standardGeneric("dbGetRowCount"),
  valueClass = "numeric"
)


#' @rdname dbGetInfo
#' @section Implementation notes:
#' The default implementation for \code{DBIResult objects}
#' constructs such a list from the return values of the corresponding methods,
#' \code{\link{dbGetStatement}}, \code{\link{dbGetRowCount}},
#' \code{\link{dbGetRowsAffected}}, and \code{\link{dbHasCompleted}}.
setMethod("dbGetInfo", "DBIResult", function(dbObj, ...) {
  list(
    statement = dbGetStatement(dbObj),
    row.count = dbGetRowCount(dbObj),
    rows.affected = dbGetRowsAffected(dbObj),
    has.completed = dbHasCompleted(dbObj)
  )
})


#' Bind values to a parameterised/prepared statement.
#'
#' @inheritParams dbClearResult
#' @param params A list of bindings. Named values should be matched to
#'   named paramters (if supported by the DBI backend). Unnamed values
#'   will be matched by position. I don't recommend mixing named and unnamed
#'   values.
#' @export
setGeneric("dbBind", function(res, params, ...) {
  standardGeneric("dbBind")
})


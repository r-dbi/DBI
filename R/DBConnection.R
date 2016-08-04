#' DBIConnection class
#'
#' This virtual class encapsulates the connection to a DBMS, and it provides
#' access to dynamic queries, result sets, DBMS session management
#' (transactions), etc.
#'
#' @section Implementation note:
#' Individual drivers are free to implement single or multiple simultaneous
#' connections.
#'
#' @docType class
#' @name DBIConnection-class
#' @family DBI classes
#' @examples
#' \dontrun{
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#' dbDisconnect(con)
#'
#' con <- dbConnect(RPostgreSQL::PostgreSQL(), "username", "passsword")
#' dbDisconnect(con)
#' }
#' @export
#' @include DBObject.R
setClass("DBIConnection", contains = c("DBIObject", "VIRTUAL"))

#' @rdname hidden_aliases
#' @param object Object to display
#' @export
setMethod("show", "DBIConnection", function(object) {
  # to protect drivers that fail to implement the required methods (e.g.,
  # RPostgreSQL)
  tryCatch(
    show_connection(object),
    error = function(e) NULL)
  invisible(NULL)
})

show_connection <- function(object) {
  cat("<", is(object)[1], ">\n", sep = "")
  if (!dbIsValid(object)) {
    cat("  DISCONNECTED\n")
  }
}

#' Disconnect (close) a connection
#'
#' This closes the connection, discards all pending work, and frees
#' resources (e.g., memory, sockets).
#'
#' @param conn A \code{\linkS4class{DBIConnection}} object, as produced by
#'   \code{\link{dbConnect}}.
#' @param ... Other parameters passed on to methods.
#' @return a logical vector of length 1, indicating success or failure.
#' @export
#' @family connection methods
#' @examples
#' if (require("RSQLite")) {
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#' dbDisconnect(con)
#' }
setGeneric("dbDisconnect",
  def = function(conn, ...) standardGeneric("dbDisconnect"),
  valueClass = "logical"
)

#' Execute a statement on a given database connection
#'
#' The function \code{dbSendQuery} only submits and synchronously executes the
#' SQL statement to the database engine.  It does \emph{not} extract any
#' records --- for that you need to use the function \code{\link{dbFetch}}, and
#' then you must call \code{\link{dbClearResult}} when you finish fetching the
#' records you need. For interactive use, you should almost always prefer
#' \code{\link{dbGetQuery}}.
#'
#' @inheritParams dbDisconnect
#' @param statement a character vector of length 1 containing SQL.
#' @return An object that inherits from \code{\linkS4class{DBIResult}}.
#'   If the statement generates output (e.g., a \code{SELECT} statement) the
#'   result set can be used with \code{\link{dbFetch}} to extract records.
#'
#'   Once you have finished using a result, make sure to disconnect it
#'   with \code{\link{dbClearResult}}.
#'
#' @section Side Effects:
#' The statement is submitted to the database server and the DBMS executes the
#' statement, possibly generating vast amounts of data. Where these data live
#' is driver-specific: some drivers may choose to leave the output on the server
#' and transfer them piecemeal to R, others may transfer all the data to the
#' client -- but not necessarily to the memory that R manages. See individual
#' drivers \code{dbSendQuery} documentation for details.
#' @family connection methods
#' @examples
#' if (require("RSQLite")) {
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars)
#' res <- dbSendQuery(con, "SELECT * FROM mtcars WHERE cyl = 4;")
#' dbFetch(res)
#' dbClearResult(res)
#'
#' dbDisconnect(con)
#' }
#' @export
setGeneric("dbSendQuery",
  def = function(conn, statement, ...) standardGeneric("dbSendQuery"),
  valueClass = "DBIResult"
)

# #' @export
# dbBreak <- structure(list(), class = "dbiAbort")

# dbFetchChunkedQuery <- function(rs, callback, n) {
#   rowsSoFar <- 0
#   while (TRUE) {
#     chunk <- dbFetch(rs, n = n)
#     if (nrow(chunk) == 0) break
#     rowsSoFar <<- rowsSoFar + nrow(chunk)
#     result <- callback(df = chunk, index = rowsSoFar)
#     if (inherits(result, "dbiAbort")) break
#   }
#   invisible(chunk)
# }

dbFetchChunkedQuery <- function(rs, callback, n) {
  callback <- as_chunk_callback(callback)
  on.exit(callback$finally(), add = TRUE)
  rowsSoFar <- 0

  chunk <- dbFetch(rs, n = n)
  while (callback$continue() && nrow(chunk) > 0) {
    callback$receive(chunk, rowsSoFar)
    rowsSoFar <<- rowsSoFar + nrow(chunk)
    chunk <- dbFetch(rs, n = n)
  }

  return(invisible(callback$result()))
}

#' Fetch data in chunks and access it with a callback
#'
#' This function allows you to fetch data in chunks of \code{n} rows at a time
#' and acess that chunk using a callback. This is meant as a safer and more
#' efficient alternative to \code{\link{dbSendQuery}}. On one hand, it does not
#' keep the result set open, so you don't have to worry about
#' \code{\link{dbClearResult}}. On the other hand, you never need to have all
#' of the data on your machine at once (each chunk comes and goes), but you can
#' still produce global results.
#'
#' For most use cases, you will want to actually loop through all of the data.
#' But there are some cases for which this is not true (for example, if you
#' just want to locate a particular row). In these situations, you can stop the
#' function from continuing to execute once your terminating condition is met.
#' To do so, use: \code{if (terminatingCondition) return(dbBreak)}.
#' \code{dbBreak} is a sentinel value that \code{DBI} recognizes and knows how
#' to interpret correctly.
#'
#' @name dbGetChunkedQuery
#' @aliases dbBreak dbGetChunkedQuery
#' dbGetChunkedQuery,DBIConnection,character-method
#' @docType data
#' @param conn A \code{\linkS4class{DBIConnection}} object, as produced by
#' \code{\link{dbConnect}}.
#' @param statement A character vector of length 1 containing SQL.
#' @param callback A callback function whose signature must be:
#' \code{function(df, index)}, where \code{df} is be the (partial) result set
#' (expressed as a dataframe) returned by the \code{statement}, and
#' \code{index} is the cumulative number of rows fetched so far.
#' @param n The number of rows to fetch in each chunk.
#' @param ... Other parameters passed on to methods.
#' @return The last chunk of data fetched (invisibly).
#' @seealso Other connection methods: \code{\link{dbDisconnect}},
#' \code{\link{dbExistsTable}}, \code{\link{dbGetException}},
#' \code{\link{dbGetQuery}}, \code{\link{dbListFields}},
#' \code{\link{dbListResults}}, \code{\link{dbListTables}},
#' \code{\link{dbReadTable}}, \code{\link{dbRemoveTable}},
#' \code{\link{dbSendQuery}}
#' @keywords datasets
#' @export
#' @examples
#'
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#' dbWriteTable(con, "cars", cars)
#'
#' ## Want to loop through all chunks to produce a global result
#' distSum <- 0
#' rowCount <- 0
#'
#' dbGetChunkedQuery(con, "SELECT dist FROM cars", function(df, index) {
#'   distSum <<- distSum + sum(df$dist)
#'   rowCount <<- rowCount + nrow(df)
#' }, n = 10)
#'
#' (distAvg <- distSum / rowCount)
#'
#' ## Want to stop once we find the row we're looking for
#' rowCount <- 0
#'
#' dbGetChunkedQuery(con, "SELECT * FROM cars", function(df, index) {
#'   rowCount <<- rowCount + nrow(df)
#'   if (df$speed == 19 && df$dist == 46) {
#'     print(paste("Your row is number", rowCount))
#'     FALSE
#'   }
#' }, n = 1)
#'
#' dbDisconnect(con)
setGeneric("dbGetChunkedQuery",
  function(conn, statement, callback, n = 10000L, ...) {
   standardGeneric("dbGetChunkedQuery")
  },
  signature = c("conn", "statement")
)

#' @export
setMethod("dbGetChunkedQuery", signature("DBIConnection", "character"),
  function(conn, statement, callback, n, ...) {
    rs <- dbSendQuery(conn, statement, ...)
    on.exit(dbClearResult(rs))
    dbFetchChunkedQuery(rs, callback, n)
  }
)

#' Execute an SQL statement that does not produce a result set
#'
#' This function should be used when you want to execute a
#' non-\code{SELECT} query on table (ex: \code{UPDATE}, \code{DELETE},
#' \code{INSERT INTO}, \code{DROP TABLE}, ...). It will execute
#' the query and return the number of rows affected by the operation.
#' The default implementation calls \code{\link{dbSendQuery}} and
#' \code{\link{dbGetRowsAffected}}, which is useful if a backend does not
#' distinguish between \code{SELECT} and non-\code{SELECT} queries.
#'
#' @inheritParams dbDisconnect
#' @param statement a character vector of length 1 containing SQL.
#' @return The number of rows affected by the \code{statement}
#' @family connection methods
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#' dbWriteTable(con, "cars", head(cars, 3))
#' dbReadTable(con, "cars")   # there's 3 rows!
#' dbExecute(con, "INSERT INTO cars (speed, dist)
#'                 VALUES (1, 1), (2, 2), (3, 3);")
#' dbReadTable(con, "cars")   # there's now 6 rows!
#' dbDisconnect(con)
setGeneric("dbExecute",
  def = function(conn, statement, ...) standardGeneric("dbExecute")
)

#' @rdname hidden_aliases
#' @export
setMethod("dbExecute", signature("DBIConnection", "character"),
  function(conn, statement, ...) {
    rs <- dbSendQuery(conn, statement, ...)
    on.exit(dbClearResult(rs))
    dbGetRowsAffected(rs)
  }
)

#' Send query, retrieve results and then clear result set
#'
#' \code{dbGetQuery} comes with a default implementation that calls
#' \code{\link{dbSendQuery}}, then \code{\link{dbFetch}}, ensuring that
#' the result is always free-d by \code{\link{dbClearResult}}.
#'
#' @section Implementation notes:
#' Subclasses should override this method only if they provide some sort of
#' performance optimisation.
#'
#' @inheritParams dbDisconnect
#' @param statement a character vector of length 1 containing SQL.
#' @family connection methods
#' @export
#' @examples
#' if (require("RSQLite")) {
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars)
#' dbGetQuery(con, "SELECT * FROM mtcars")
#'
#' dbBegin(con)
#' dbGetQuery(con, "DELETE FROM mtcars WHERE cyl == 4")
#' dbRollback(con)
#'
#' dbDisconnect(con)
#' }
setGeneric("dbGetQuery",
  def = function(conn, statement, ...) standardGeneric("dbGetQuery")
)

#' @rdname hidden_aliases
#' @export
setMethod("dbGetQuery", signature("DBIConnection", "character"),
  function(conn, statement, ...) {
    rs <- dbSendQuery(conn, statement, ...)
    on.exit(dbClearResult(rs))

    df <- tryCatch(
      dbFetch(rs, n = -1, ...),
      error = function(e) {
        warning(conditionMessage(e), call. = conditionCall(e))
        NULL
      }
    )

    if (!dbHasCompleted(rs)) {
      warning("Pending rows", call. = FALSE)
    }

    df
  }
)

#' Get DBMS exceptions
#'
#' @inheritParams dbDisconnect
#' @family connection methods
#' @return a list with elements \code{errNum} (an integer error number) and
#'   \code{errMsg} (a character string) describing the last error in the
#'   connection \code{conn}.
#' @export
setGeneric("dbGetException",
  def = function(conn, ...) standardGeneric("dbGetException")
)

#' A list of all pending results
#'
#' List of \linkS4class{DBIResult} objects currently active on the connection.
#'
#' @inheritParams dbDisconnect
#' @family connection methods
#' @return a list. If no results are active, an empty list. If only
#'   a single result is active, a list with one element.
#' @export
setGeneric("dbListResults",
  def = function(conn, ...) standardGeneric("dbListResults")
)

#' List field names of a remote table
#'
#' @inheritParams dbDisconnect
#' @param name a character string with the name of the remote table.
#' @return a character vector
#' @family connection methods
#' @seealso \code{\link{dbColumnInfo}} to get the type of the fields.
#' @export
setGeneric("dbListFields",
  def = function(conn, name, ...) standardGeneric("dbListFields"),
  valueClass = "character"
)

#' List remote tables
#'
#' This should, where possible, include temporary tables.
#'
#' @inheritParams dbDisconnect
#' @return a character vector. If no tables present, a character vector
#'   of length 0.
#' @family connection methods
#' @export
setGeneric("dbListTables",
  def = function(conn, ...) standardGeneric("dbListTables"),
  valueClass = "character"
)

#' Copy data frames to and from database tables
#'
#' \code{dbReadTable}: database table -> data frame; \code{dbWriteTable}:
#' data frame -> database table.
#'
#' @note The translation of identifiers between R and SQL is done through calls
#'   to \code{\link{make.names}} and \code{\link{make.db.names}}, but we cannot
#'   guarantee that the conversion is reversible.  For details see
#'   \code{\link{make.db.names}}.
#' @inheritParams dbDisconnect
#' @param name A character string specifying a DBMS table name.
#' @param value a data.frame (or coercible to data.frame).
#' @family connection methods
#' @return a data.frame.
#' @export
#' @examples
#' if (require("RSQLite")) {
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars[1:10, ])
#' dbReadTable(con, "mtcars")
#'
#' dbDisconnect(con)
#' }
setGeneric("dbReadTable", valueClass = "data.frame",
  signature = c("conn", "name"),
  function(conn, name, ...) {
    standardGeneric("dbReadTable")
  }
)

#' @rdname dbReadTable
#' @export
setGeneric("dbWriteTable", valueClass = "logical",
  signature = c("conn", "name", "value"),
  function(conn, name, value, ...) {
    standardGeneric("dbWriteTable")
  }
)

#' Does a table exist?
#'
#' @inheritParams dbDisconnect
#' @param name A character string specifying a DBMS table name.
#' @family connection methods
#' @return a logical vector of length 1.
#' @export
setGeneric("dbExistsTable",
  def = function(conn, name, ...) standardGeneric("dbExistsTable"),
  valueClass = "logical"
)

#' Remove a table from the database
#'
#' Executes the sql \code{DROP TABLE name}.
#'
#' @inheritParams dbDisconnect
#' @param name A character string specifying a DBMS table name.
#' @family connection methods
#' @return a logical vector of length 1 indicating success or failure.
#' @export
setGeneric("dbRemoveTable",
  def = function(conn, name, ...) standardGeneric("dbRemoveTable"),
  valueClass = "logical"
)

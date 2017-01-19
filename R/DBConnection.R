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
#' @family DBIConnection generics
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#' con
#' dbDisconnect(con)
#'
#' \dontrun{
#' con <- dbConnect(RPostgreSQL::PostgreSQL(), "username", "passsword")
#' con
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
#' @inherit DBItest::spec_connection_disconnect return
#' @inheritSection DBItest::spec_connection_disconnect Specification
#'
#' @inheritParams dbGetQuery
#' @return a logical vector of length 1, indicating success or failure.
#' @family DBIConnection generics
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#' dbDisconnect(con)
setGeneric("dbDisconnect",
  def = function(conn, ...) standardGeneric("dbDisconnect")
)

#' Execute a query on a given database connection
#'
#' The function `dbSendQuery` only submits and synchronously executes the
#' SQL query to the database engine.  It does \emph{not} extract any
#' records --- for that you need to use the function [dbFetch()], and
#' then you must call [dbClearResult()] when you finish fetching the
#' records you need. For interactive use, you should almost always prefer
#' [dbGetQuery()].
#'
#' This function is for `SELECT` queries only.  Some backends may
#' support data manipulation queries through this function for compatibility
#' reasons.  However, callers are strongly encouraged to use
#' [dbSendStatement()] for data manipulation statements.
#'
#' @inherit DBItest::spec_result_send_query return
#' @inheritSection DBItest::spec_result_send_query Specification
#'
#' @inheritParams dbGetQuery
#' @param statement a character vector of length 1 containing SQL.
#'
#' @section Side Effects:
#' The query is submitted to the database server and the DBMS executes it,
#' possibly generating vast amounts of data. Where these data live
#' is driver-specific: some drivers may choose to leave the output on the server
#' and transfer them piecemeal to R, others may transfer all the data to the
#' client -- but not necessarily to the memory that R manages. See individual
#' drivers' `dbSendQuery` documentation for details.
#' @family DBIConnection generics
#' @seealso For updates: [dbSendStatement()] and [dbExecute()].
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars)
#' rs <- dbSendQuery(con, "SELECT * FROM mtcars WHERE cyl = 4;")
#' dbFetch(rs)
#' dbClearResult(rs)
#'
#' dbDisconnect(con)
#' @export
setGeneric("dbSendQuery",
  def = function(conn, statement, ...) standardGeneric("dbSendQuery"),
  valueClass = "DBIResult"
)

#' Execute a data manipulation statement on a given database connection
#'
#' The function `dbSendStatement` only submits and synchronously executes the
#' SQL data manipulation statement (e.g., `UPDATE`, `DELETE`,
#' `INSERT INTO`, `DROP TABLE`, ...) to the database engine.  To query
#' the number of affected rows, call [dbGetRowsAffected()] on the
#' returned result object.  You must also call [dbClearResult()] after
#' that. For interactive use, you should almost always prefer
#' [dbExecute()].
#'
#' [dbSendStatement()] comes with a default implementation that simply
#' forwards to [dbSendQuery()], to support backends that only
#' implement the latter.
#'
#' @inheritParams dbGetQuery
#' @param statement a character vector of length 1 containing SQL.
#' @return An object that inherits from \code{\linkS4class{DBIResult}}.
#'   Once you have finished using a result, make sure to disconnect it
#'   with [dbClearResult()].
#'
#' @family DBIConnection generics
#' @seealso For queries: [dbSendQuery()] and [dbGetQuery()].
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "cars", head(cars, 3))
#' rs <- dbSendStatement(con,
#'   "INSERT INTO cars (speed, dist) VALUES (1, 1), (2, 2), (3, 3);")
#' dbHasCompleted(rs)
#' dbGetRowsAffected(rs)
#' dbClearResult(rs)
#' dbReadTable(con, "cars")   # there are now 6 rows
#'
#' dbDisconnect(con)
#' @export
setGeneric("dbSendStatement",
           def = function(conn, statement, ...) standardGeneric("dbSendStatement"),
           valueClass = "DBIResult"
)

#' @rdname hidden_aliases
#' @export
setMethod(
  "dbSendStatement", signature("DBIConnection", "character"),
  function(conn, statement, ...) {
    dbSendQuery(conn, statement, ...)
  }
)

#' Send query, retrieve results and then clear result set
#'
#' `dbGetQuery` comes with a default implementation that calls
#' [dbSendQuery()], then [dbFetch()], ensuring that
#' the result is always free-d by [dbClearResult()].
#'
#' This function is for `SELECT` queries only.  Some backends may
#' support data manipulation statements through this function for compatibility
#' reasons.  However callers are strongly advised to use
#' [dbExecute()] for data manipulation statements.
#'
#' @inherit DBItest::spec_result_get_query return
#' @inheritSection DBItest::spec_result_get_query Specification
#'
#' @section Implementation notes:
#' Subclasses should override this method only if they provide some sort of
#' performance optimisation.
#'
#' @param conn A \code{\linkS4class{DBIConnection}} object, as returned by
#'   [dbConnect()].
#' @param statement a character vector of length 1 containing SQL.
#' @param ... Other parameters passed on to methods.
#' @family DBIConnection generics
#' @seealso For updates: [dbSendStatement()] and [dbExecute()].
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars)
#' dbGetQuery(con, "SELECT * FROM mtcars")
#'
#' dbDisconnect(con)
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

#' Execute an update statement, query number of rows affected, and then close result set
#'
#' `dbExecute` comes with a default implementation
#' (which should work with most backends) that calls
#' [dbSendStatement()], then [dbGetRowsAffected()], ensuring that
#' the result is always free-d by [dbClearResult()].
#'
#' @inheritParams dbGetQuery
#' @param statement a character vector of length 1 containing SQL.
#' @return The number of rows affected by the `statement`
#' @family DBIConnection generics
#' @seealso For queries: [dbSendQuery()] and [dbGetQuery()].
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "cars", head(cars, 3))
#' dbReadTable(con, "cars")   # there are 3 rows
#' dbExecute(con,
#'   "INSERT INTO cars (speed, dist) VALUES (1, 1), (2, 2), (3, 3);")
#' dbReadTable(con, "cars")   # there are now 6 rows
#'
#' dbDisconnect(con)
setGeneric(
  "dbExecute",
  def = function(conn, statement, ...) standardGeneric("dbExecute")
)

#' @rdname hidden_aliases
#' @export
setMethod(
  "dbExecute", signature("DBIConnection", "character"),
  function(conn, statement, ...) {
    rs <- dbSendStatement(conn, statement, ...)
    on.exit(dbClearResult(rs))
    dbGetRowsAffected(rs)
  }
)

#' Get DBMS exceptions
#'
#' @inheritParams dbGetQuery
#' @family DBIConnection generics
#' @return a list with elements `errorNum` (an integer error number) and
#'   `errorMsg` (a character string) describing the last error in the
#'   connection `conn`.
#' @export
setGeneric("dbGetException",
  def = function(conn, ...) standardGeneric("dbGetException")
)

#' A list of all pending results
#'
#' List of \linkS4class{DBIResult} objects currently active on the connection.
#'
#' @inheritParams dbGetQuery
#' @family DBIConnection generics
#' @return a list. If no results are active, an empty list. If only
#'   a single result is active, a list with one element.
#' @export
setGeneric("dbListResults",
  def = function(conn, ...) standardGeneric("dbListResults")
)

#' List field names of a remote table
#'
#' @inheritParams dbGetQuery
#' @param name a character string with the name of the remote table.
#' @return a character vector
#' @family DBIConnection generics
#' @seealso [dbColumnInfo()] to get the type of the fields.
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars)
#' dbListFields(con, "mtcars")
#'
#' dbDisconnect(con)
setGeneric("dbListFields",
  def = function(conn, name, ...) standardGeneric("dbListFields"),
  valueClass = "character"
)

#' List remote tables
#'
#' This should, where possible, include temporary tables.
#'
#' @inheritParams dbGetQuery
#' @return a character vector. If no tables present, a character vector
#'   of length 0.
#' @family DBIConnection generics
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbListTables(con)
#' dbWriteTable(con, "mtcars", mtcars)
#' dbListTables(con)
#'
#' dbDisconnect(con)
setGeneric("dbListTables",
  def = function(conn, ...) standardGeneric("dbListTables"),
  valueClass = "character"
)

#' Copy data frames to and from database tables
#'
#' `dbReadTable`: database table -> data frame; `dbWriteTable`:
#' data frame -> database table.
#'
#' @note The translation of identifiers between R and SQL is done through calls
#'   to [make.names()] and [make.db.names()], but we cannot
#'   guarantee that the conversion is reversible.  For details see
#'   [make.db.names()].
#' @inheritParams dbGetQuery
#' @param name A character string specifying a DBMS table name.
#' @param value a data.frame (or coercible to data.frame).
#' @family DBIConnection generics
#' @return a data.frame.
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars[1:10, ])
#' dbReadTable(con, "mtcars")
#'
#' dbDisconnect(con)
setGeneric("dbReadTable", valueClass = "data.frame",
  signature = c("conn", "name"),
  function(conn, name, ...) standardGeneric("dbReadTable")
)

#' @rdname dbReadTable
#' @export
setGeneric("dbWriteTable",
  signature = c("conn", "name", "value"),
  function(conn, name, value, ...) standardGeneric("dbWriteTable")
)

#' Does a table exist?
#'
#' @inheritParams dbGetQuery
#' @param name A character string specifying a DBMS table name.
#' @family DBIConnection generics
#' @return a logical vector of length 1.
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbExistsTable(con, "iris")
#' dbWriteTable(con, "iris", iris)
#' dbExistsTable(con, "iris")
#'
#' dbDisconnect(con)
setGeneric("dbExistsTable",
  def = function(conn, name, ...) standardGeneric("dbExistsTable"),
  valueClass = "logical"
)

#' Remove a table from the database
#'
#' Executes the sql `DROP TABLE name`.
#'
#' @inheritParams dbGetQuery
#' @param name A character string specifying a DBMS table name.
#' @family DBIConnection generics
#' @return a logical vector of length 1 indicating success or failure.
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbExistsTable(con, "iris")
#' dbWriteTable(con, "iris", iris)
#' dbExistsTable(con, "iris")
#' dbRemoveTable(con, "iris")
#' dbExistsTable(con, "iris")
#'
#' dbDisconnect(con)
setGeneric("dbRemoveTable",
  def = function(conn, name, ...) standardGeneric("dbRemoveTable")
)

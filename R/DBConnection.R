#' DBIConnection class.
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
setClass("DBIConnection", representation("DBIObject", "VIRTUAL"))

#' @param object Object to display
#' @rdname DBIConnection-class
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

#' Execute a statement on a given database connection.
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

#' Send query, retrieve results and then clear result set.
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
#' @aliases dbGetQuery,DBIConnection,character-method
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

#' Get DBMS exceptions.
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

#' A list of all pending results.
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

#' List field names of a remote table.
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

#' List remote tables.
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

#' Copy data frames to and from database tables.
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

#' Remove a table from the database.
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

#' Begin/commit/rollback SQL transactions
#'
#' Not all database engines implement transaction management, in which case
#' these methods should not be implemented for the specific
#' \code{\linkS4class{DBIConnection}} subclass.
#'
#' @section Side Effects:
#' The current transaction on the connections \code{con} is committed or rolled
#' back.
#'
#' @inheritParams dbDisconnect
#' @return a logical indicating whether the operation succeeded or not.
#' @examples
#' \dontrun{
#' ora <- dbDriver("Oracle")
#' con <- dbConnect(ora)
#' rs <- dbSendQuery(con,
#'       "delete * from PURGE as p where p.wavelength<0.03")
#' if(dbGetInfo(rs, what = "rowsAffected") > 250){
#'   warning("dubious deletion -- rolling back transaction")
#'   dbRollback(con)
#' }
#' }
#' @name transactions
NULL

#' @export
#' @rdname transactions
setGeneric("dbBegin",
  def = function(conn, ...) standardGeneric("dbBegin"),
  valueClass = "logical"
)

#' @export
#' @rdname transactions
setGeneric("dbCommit",
  def = function(conn, ...) standardGeneric("dbCommit"),
  valueClass = "logical"
)

#' @export
#' @rdname transactions
setGeneric("dbRollback",
  def = function(conn, ...) standardGeneric("dbRollback"),
  valueClass = "logical"
)

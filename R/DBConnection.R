#' DBIConnection class.
#' 
#' Base class for all DBMS connection classes.  Individual drivers (ODBC,
#' Oracle, PostgreSQL, MySQL, etc.)  extend this class in a database-specific
#' manner.
#' 
#' @docType class
#' @name DBIConnection-class
#' @family DBI classes
#' @examples
#' \dontrun{
#' ora <- dbDriver("Oracle")
#' con <- dbConnect(ora, "user/password@@dbname")
#' 
#' pg <- dbDriver("PostgreSQL")
#' con <- dbConnect(pg, "user", "password")
#' }
#' @export
#' @include DBObject.R
setClass("DBIConnection", representation("DBIObject", "VIRTUAL"))

#' Disconnect (close) a connection
#' 
#' @param conn A \code{\linkS4class{DBIConnection}} object, as produced by 
#'   \code{\link{dbConnect}}.
#' @param ... Other parameters passed on to methods.
#' @return a logical vector of length 1, indicating success or failure.
#' @export
#' @family connection methods
setGeneric("dbDisconnect", 
  def = function(conn, ...) standardGeneric("dbDisconnect"),
  valueClass = "logical"
)

#' Execute a statement on a given database connection.
#' 
#' The function \code{dbSendQuery} only submits and synchronously executes the
#' SQL statement to the database engine.  It does \emph{not} extracts any
#' records --- for that you need to use the function \code{\link{fetch}}, and
#' then you must call \code{\link{dbClearResult}} when you finish fetching the 
#' records you need.
#' 
#' @param conn A \code{\linkS4class{DBIConnection}} object, as produced by 
#'   \code{\link{dbConnect}}.
#' @param ... Other parameters passed on to methods.
#' @param statement a character vector of length 1 containing SQL.
#' @return An object that inherits from \code{\linkS4class{DBIResult}}. 
#'   If the statement generates output (e.g., a \code{SELECT} statement) the 
#'   result set can be used with \code{\link{fetch}} to extract records.
#' 
#' @section Side Effects: 
#' The statement is submitted for synchronous execution
#' to the server connected through the \code{conn} object.  The DBMS executes
#' the statement, possibly generating vast amounts of data.  Where these data
#' reside is driver-specific: some drivers may choose to leave the output on
#' the server and transfer them piecemeal to R/Splus, others may transfer all
#' the data to the client -- but not necessarily to the memory that R/Splus
#' manages.  See the individual drivers' \code{\link{dbSendQuery}} method for
#' implementation details.
#' @family connection methods
#' @examples
#' \dontrun{
#' drv <- dbDriver("MySQL")
#' con <- dbConnect(drv)
#' res <- dbSendQuery(con, "SELECT * from liv25")
#' data <- fetch(res, n = -1)
#' }
#' @export
setGeneric("dbSendQuery", 
  def = function(conn, statement, ...) standardGeneric("dbSendQuery"),
  valueClass = "DBIResult"
)

#' Send query, retrieve results and then clear result set.
#' 
#' @param conn A \code{\linkS4class{DBIConnection}} object, as produced by 
#'   \code{\link{dbConnect}}.
#' @param ... Other parameters passed on to methods.
#' @family connection methods
#' @export
setGeneric("dbGetQuery", 
  def = function(conn, statement, ...) standardGeneric("dbGetQuery")
)

#' Get DBMS exceptions.
#' 
#' @param conn A \code{\linkS4class{DBIConnection}} object, as produced by 
#'   \code{\link{dbConnect}}.
#' @param ... Other parameters passed on to methods.
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
#' @param conn A \code{\linkS4class{DBIConnection}} object, as produced by 
#'   \code{\link{dbConnect}}.
#' @param ... Other parameters passed on to methods.
#' @family connection methods
#' @export
setGeneric("dbListResults", 
  def = function(conn, ...) standardGeneric("dbListResults")
)

#' List field names of a remote table.
#' 
#' @param conn A \code{\linkS4class{DBIConnection}} object, as produced by 
#'   \code{\link{dbConnect}}.
#' @param ... Other parameters passed on to methods.
#' @param name a character string with the name of the remote table.
#' @return a character vector
#' @family connection methods
#' @export
setGeneric("dbListFields", 
  def = function(conn, name, ...) standardGeneric("dbListFields"),
  valueClass = "character"
)

#' List remote tables.
#' 
#' This should, where possible, include temporary tables.
#' 
#' @param conn A \code{\linkS4class{DBIConnection}} object, as produced by 
#'   \code{\link{dbConnect}}.
#' @param ... Other parameters passed on to methods.
#' @param ... other arguments passed on to methods
#' @return a character vector
#' @family connection methods
#' @export
setGeneric("dbListTables",
  def = function(conn, ...) standardGeneric("dbListTables"),
  valueClass = "character"
)

#' Create a data frame from a database table.
#' 
#' @note The translation of identifiers between R/Splus and SQL is done through
#' calls to \code{\link{make.names}} and \code{\link{make.db.names}}, but we
#' cannot guarantee that the conversion is reversible.  For details see
#' \code{\link{make.db.names}}.
#'
#' @section Implementation notes:
#' 
#' Method should also accept the \code{row.names} argument. This can be a 
#' string or an index specifying the column in the DBMS table to be used as
#' \code{row.names} in the output data.frame (a \code{NULL}, \code{""}, or 0 
#' specifies that no column should be used as \code{row.names} in the output).
#' 
#' @param conn A \code{\linkS4class{DBIConnection}} object, as produced by 
#'   \code{\link{dbConnect}}.
#' @param name A character string specifying a DBMS table name.
#' @param ... Other parameters passed on to methods.
#' @family connection methods
#' @return a data.frame.
#' @export
setGeneric("dbReadTable", 
  def = function(conn, name, ...) standardGeneric("dbReadTable"),
  valueClass = "data.frame"
)

#' Create a database table from data frame.
#' 
#' @section Implementation notes:
#' 
#' Method should also accept:
#' 
#' \itemize{
#'   \item \code{row.names}: A logical specifying whether the \code{row.names} 
#'     should be output to the output DBMS table; if \code{TRUE}, the extra 
#'     field name will be whatever the S identifier \code{"row.names"} maps to 
#'     the DBMS (see \code{\link{make.db.names}}).
#'   \item \code{overwrite}: a logical specifying whether to overwrite an 
#'     existing table or not. Its default is \code{FALSE}
#'   \item \code{append}: a logical specifying whether to append to an existing 
#'     table in the DBMS.  Its default is \code{FALSE}.  
#' }
#' @inheritParams dbReadTable
#' @param conn A \code{\linkS4class{DBIConnection}} object, as produced by 
#'   \code{\link{dbConnect}}.
#' @param name A character string specifying a DBMS table name.
#' @param ... Other parameters passed on to methods.
#' @param value a data.frame (or coercible to data.frame).
#' @family connection methods
#' @return a logical vector of length 1 indicating success or failure.
#' @export
setGeneric("dbWriteTable",
  def = function(conn, name, value, ...) standardGeneric("dbWriteTable"),
  valueClass = "logical"
)

#' Does a table exist?
#' 
#' @param conn A \code{\linkS4class{DBIConnection}} object, as produced by 
#'   \code{\link{dbConnect}}.
#' @param name A character string specifying a DBMS table name.
#' @param ... Other parameters passed on to methods.
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
#' @param conn A \code{\linkS4class{DBIConnection}} object, as produced by 
#'   \code{\link{dbConnect}}.
#' @param name A character string specifying a DBMS table name.
#' @param ... Other parameters passed on to methods.
#' @family connection methods
#' @return a logical vector of length 1 indicating success or failure.
#' @export
setGeneric("dbRemoveTable",
  def = function(conn, name, ...) standardGeneric("dbRemoveTable"),
  valueClass = "logical"
)

#' Commit/rollback SQL transactions
#' 
#' Not all database engines implement transaction management, in which case
#' these methods should not be implemented for the specific 
#' \code{\linkS4class{DBIConnection}} subclass.
#' 
#' @section Side Effects: 
#' The current transaction on the connections \code{con} is committed or rolled 
#' back.
#' 
#' @param conn A \code{\linkS4class{DBIConnection}} object, as produced by 
#'   \code{\link{dbConnect}}.
#' @param ... Other parameters passed on to methods.
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

#' Call an SQL stored procedure
#' 
#' Not yet implemented.
#' 
#' @param conn a \code{DBIConnection} object.
#' @param ... additional arguments are passed to the implementing method.
#' @keywords internal
#' @export
setGeneric("dbCallProc", 
  def = function(conn, ...) standardGeneric("dbCallProc"),
  valueClass = "logical"
)

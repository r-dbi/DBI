#' DBIDriver class.
#' 
#' Base class for all DBMS drivers (e.g., ODBC, Oracle, MySQL, PostgreSQL).
#' This is a virtual class: No objects may be created from it. The function 
#' \code{\link{dbConnect}} is the main generator.
#' 
#' Typically, drivers are expected to have a function of the same name
#' that does the actual initialization, e.g., \code{MySQL()}, \code{ODBC()},
#' \code{SQLite()},
#' 
#' @docType class
#' @name DBIDriver-class
#' @family DBI classes
#' @examples
#' \dontrun{
#' drv <- dbDriver("ODBC")
#' summary(drv)
#' dbListConnections(drv)
#' }
#' @export
#' @include DBObject.R
setClass("DBIDriver", representation("DBIObject", "VIRTUAL"))


#' Load and unload database drivers.
#' 
#' These \emph{virtual} classes and their methods define the interface to
#' database management systems (DBMS).  They are extended by packages or
#' drivers that implement the methods in the context of specific DBMS (e.g.,
#' Berkeley DB, MySQL, Oracle, ODBC, PostgreSQL, SQLite).
#' 
#' The virtual class \code{DBIDriver} defines the operations for creating
#' connections and defining data type mappings.  Actual driver classes, for
#' instance \code{RPgSQL}, \code{RMySQL}, etc. implement these operations in a
#' DBMS-specific manner.
#' 
#' More generally, the DBI defines a very small set of classes and methods that
#' allows users and applications access DBMS with a common interface.  The
#' virtual classes are \code{DBIDriver} that individual drivers extend,
#' \code{DBIConnection} that represent instances of DBMS connections, and
#' \code{DBIResult} that represent the result of a DBMS statement.  These three
#' classes extend the basic class of \code{DBIObject}, which serves as the root
#' or parent of the class hierarchy.
#' 
#' @section Side Effects: 
#' The client part of the database communication is
#' initialized (typically dynamically loading C code, etc.) but note that
#' connecting to the database engine itself needs to be done through calls to
#' \code{dbConnect}.
#'
#' @param drvName character name of the driver to instantiate.
#' @param drv an object that inherits from \code{DBIDriver} as created by
#'   \code{dbDriver}.
#' @param ... any other arguments are passed to the driver \code{drvName}.
#' @return In the case of \code{dbDriver}, an driver object whose class extends
#'   \code{DBIDriver}. This object may be used to create connections to the
#'   actual DBMS engine.
#' 
#'   In the case of \code{dbUnloadDriver}, a logical indicating whether the
#'   operation succeeded or not.
#' @examples
#' \dontrun{
#' # create a MySQL instance for capacity of up to 25 simultaneous
#' # connections.
#' m <- dbDriver("MySQL", max.con = 25)
#' p <- dbDriver("PgSQL")
#' 
#' # open the connection using user, password, etc., as
#' con <- dbConnect(m, user="ip", password = "traffic", dbname="iptraffic")
#' rs <- dbSubmitQuery(con, 
#'          "select * from HTTP_ACCESS where IP_ADDRESS = '127.0.0.1'")
#' df <- fetch(rs, n = 50)
#' df2 <- fetch(rs, n = -1)
#' dbClearResult(rs)
#' 
#' pcon <- dbConnect(p, "user", "password", "dbname")
#' dbListTables(pcon)
#' }
#' @aliases dbDriver,character-method
#' @export
setGeneric("dbDriver", 
  def = function(drvName, ...) standardGeneric("dbDriver"),
  valueClass = "DBIDriver")

setMethod("dbDriver", "character",
  definition = function(drvName, ...) {
    do.call(as.character(drvName), list(...))
  }
)
#' @rdname dbDriver
#' @export
setGeneric("dbUnloadDriver", 
  def = function(drv, ...) standardGeneric("dbUnloadDriver"),
  valueClass = "logical"
)

#' Create a connection to a DBMS.
#' 
#' Connect to a DBMS going through the appropriate authorization procedure.
#' Some implementations may allow you to have multiple connections open, so you
#' may invoke this function repeatedly assigning its output to different
#' objects. The authorization mechanism is left unspecified, so check the 
#' documentation of individual drivers for details.
#' 
#' @section Side Effects: 
#' A connection between R/Splus and the database server
#' is established, and the R/Splus program becomes a client of the database
#' engine.  Typically the connections is through the TCP/IP protocol, but this
#' will depend on vendor-specific details.

#' @param drv an object that inherits from \code{\linkS4class{DBIDriver}}, or 
#'   a character string specifying the name of DBMS driver, e.g., "RSQLite", 
#'   "RMySQL", "RPostgreSQL", or an existing \code{\linkS4class{DBIConnection}}
#'   object (in order to clone an existing connection).
#' @param ... authorization arguments needed by the DBMS instance; these
#'   typically include \code{user}, \code{password}, \code{dbname}, \code{host},
#'   \code{port}, etc.  For details see the appropriate \code{DBIDriver}.
#' @return An object that extends \code{\linkS4class{DBIConnection}} in a 
#'   database-specific manner. For instance \code{dbConnect("MySQL")} produces 
#'   an object of class \code{MySQLConnection}. This object is used to direct 
#'   commands to the database engine.
#' @seealso \code{\link{dbDisconnect}} to disconnect from a database.
#' @export
#' @examples
#' \dontrun{
#' # create an RODBC instance and create one connection.
#' m <- dbDriver("RODBC")
#' 
#' # open the connection using user, passsword, etc., as
#' # specified in the file \file{\$HOME/.my.cnf}
#' con <- dbConnect(m, dsn="data.source", uid="user", pwd="password"))    
#' 
#' # Run an SQL statement by creating first a resultSet object
#' rs <- dbSendQuery(con, statement = paste(
#'                       "SELECT w.laser_id, w.wavelength, p.cut_off",
#'                       "FROM WL w, PURGE P", 
#'                       "WHERE w.laser_id = p.laser_id", 
#'                       "SORT BY w.laser_id")
#' # we now fetch records from the resultSet into a data.frame
#' data <- fetch(rs, n = -1)   # extract all rows
#' dim(data)
#' }
setGeneric("dbConnect", 
  def = function(drv, ...) standardGeneric("dbConnect"),
  valueClass = "DBIConnection"
)

#' List currently open connections.
#' 
#' Drivers that implement single connections should return a list containing 
#' a single element.
#' 
#' @param drv A object inheriting from \code{\linkS4class{DBIDriver}}
#' @param ... Other arguments passed on to methods.
#' @export
#' @return a list
setGeneric("dbListConnections", 
  def = function(drv, ...) standardGeneric("dbListConnections")
)

#' Determine the SQL data type of an object.
#' 
#' This is a generic function. The default method determines the SQL type of
#' an R/Splus object according to the SQL 92 specification, which may serve as
#' a starting point for driver implementations. The default method also provides
#' a method for data.frame which will return a character vector giving the
#' type for each column in the dataframe.
#' 
#' @section Implementation notes:
#' Implementations should provide methods (if different from the default)
#' for: logical, integer, numeric, character, factor, Date, and POSIXct.
#' 
#' @aliases
#'   dbDataType,DBIObject,list-method
#'   dbDataType,DBIObject,logical-method
#'   dbDataType,DBIObject,integer-method
#'   dbDataType,DBIObject,numeric-method
#'   dbDataType,DBIObject,character-method
#'   dbDataType,DBIObject,factor-method
#'   dbDataType,DBIObject,Date-method
#'   dbDataType,DBIObject,POSIXct-method
#' @inheritParams dbListConnections
#' @param obj R/Splus object whose SQL type we want to determine.
#' @return A character string specifying the SQL data type for \code{obj}.
#' @seealso \code{\link{isSQLKeyword}} \code{\link{make.db.names}}
#' @examples
#' \dontrun{
#' ora <- dbDriver("Oracle")
#' sql.type <- dbDataType(ora, x)
#' }
#' @export
setGeneric("dbDataType",
  def = function(dbObj, obj, ...) standardGeneric("dbDataType"),
  valueClass = "character"
)

setMethod("dbDataType", signature("DBIObject", "data.frame"), 
  function(dbObj, obj, ...) {
    vapply(obj, dbDataType, dbObj = dbObj, ..., FUN.VALUE = character(1),
      USE.NAMES = FALSE)  
  }
)

setMethod("dbDataType", signature("DBIObject", "integer"), 
  function(dbObj, obj, ...) "int"
)
setMethod("dbDataType", signature("DBIObject", "numeric"), 
  function(dbObj, obj, ...) "double"
)
setMethod("dbDataType", signature("DBIObject", "logical"), 
  function(dbObj, obj, ...) "smallint"
)
setMethod("dbDataType", signature("DBIObject", "Date"), 
  function(dbObj, obj, ...) "date"
)
setMethod("dbDataType", signature("DBIObject", "POSIXct"), 
  function(dbObj, obj, ...) "timestamp"
)
varchar <- function(dbObj, obj, ...) {
  paste0("varchar(", nchar(as.character(obj)), ")")
}
setMethod("dbDataType", signature("DBIObject", "character"), varchar)
setMethod("dbDataType", signature("DBIObject", "factor"), varchar)

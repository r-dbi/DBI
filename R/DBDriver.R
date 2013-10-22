#' DBIDriver class.
#' 
#' Base class for all DBMS drivers (e.g., ODBC, Oracle, MySQL, PostgreSQL).
#' The virtual class \code{DBIDriver} defines the operations for creating
#' connections and defining data type mappings.  Actual driver classes, for
#' instance \code{RPgSQL}, \code{RMySQL}, etc. implement these operations in a
#' DBMS-specific manner.
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
#' \code{dbDriver} is a helper method used to create an new driver object
#' given the name of a database or the corresponding R package. It works 
#' through convention: all DBI-extending packages should provide an exported
#' object with the same name as the package. \code{dbDriver} just looks for
#' this object in the right places: if you know what database you are connecting
#' to, you should call the function directly. 
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
#' if (require("RSQLite")) {
#' # Create a RSQLite driver with a string
#' d <- dbDriver("SQLite")
#' d
#' 
#' # But better, access the object directly
#' RSQLite::SQLite()
#' 
#' dbUnloadDriver(d)
#' d
#' }
#' @aliases dbDriver,character-method
#' @export
setGeneric("dbDriver", 
  def = function(drvName, ...) standardGeneric("dbDriver"),
  valueClass = "DBIDriver")

setMethod("dbDriver", "character",
  definition = function(drvName, ...) {
    findDriver(drvName)(...)
  }
)

findDriver <- function(drvName) {
  # If it exists in the global environment, use that
  d <- get2(drvName, globalenv())
  if (!is.null(d)) return(d)
  
  # Otherwise, see if the appropriately named package is available
  if (has_namespace(drvName)) {
    d <- get2(drvName, asNamespace(drvName))
    if (!is.null(d)) return(d)
  }

  pkgName <- paste0("R", drvName)
  # First, see if package with name R + drvName is available
  if (has_namespace(pkgName)) {
    d <- get2(drvName, asNamespace(pkgName))
    if (!is.null(d)) return(d)
  }
  
  # Can't find it:
  stop("Couldn't find driver ", drvName, ". Looked in:\n", 
    "* global namespace\n", 
    "* in package called ", drvName, "\n",
    "* in package called ", pkgName, 
    call. = FALSE)  
}

get2 <- function(x, env) {
  if (!exists(x, envir = env)) return(NULL)
  get(x, envir = env)
}

has_namespace <- function(x) {
  suppressMessages(requireNamespace(x, quietly = TRUE))
}

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
#' Each driver will define what other arguments are required, e.g., 
#' \code{"dbname"} for the database name, \code{"username"}, and 
#' \code{"password"}.

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
#' Drivers that implement only a single connections MUST return a list 
#' containing a single element. If no connection are open, methods MUST 
#' return an empty list.
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
#' The data types supported by databases are different than the
#' data types in R, but the mapping between the primitve
#' types is straightforward:  Any of the many fixed and varying
#' length character types are mapped to character vectors.
#' Fixed-precision (non-IEEE) numbers are mapped into either numeric
#' or integer vectors.
#' 
#' Notice that many DBMS do not follow IEEE arithmetic, so there are
#' potential problems with under/overflows and loss of precision.
#'
#' @section Implementation notes:
#' Implementations should provide methods (if different from the default)
#' for: logical, integer, numeric, character, factor, Date, and POSIXct.
#' 
#' @aliases
#'   dbDataType,DBIObject,data.frame-method
#'   dbDataType,DBIObject,logical-method
#'   dbDataType,DBIObject,integer-method
#'   dbDataType,DBIObject,numeric-method
#'   dbDataType,DBIObject,character-method
#'   dbDataType,DBIObject,factor-method
#'   dbDataType,DBIObject,Date-method
#'   dbDataType,DBIObject,POSIXct-method
#' @inheritParams dbListConnections
#' @param dbObj A object inheriting from \code{\linkS4class{DBIDriver}}
#' @param obj An R object whose SQL type we want to determine.
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
  paste0("varchar(", max(nchar(as.character(obj))), ")")
}
setMethod("dbDataType", signature("DBIObject", "character"), varchar)
setMethod("dbDataType", signature("DBIObject", "factor"), varchar)

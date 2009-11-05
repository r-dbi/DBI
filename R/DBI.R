## $Id$
##
## 
## Database Interface Definition
## 
##   Define all the classes and methods to be used by an implementation
##   of the Database Interface (DBI).  All these classes are virtual and
##   each driver should extend them to provide the actual implementation.
##   See the files DBI.RODBC, DBI.PgSQL, and DBI.RMySQL for concrete
##   implementations.  
##
## Class hierarchy: (the "*" prefix indicates a virtual class.)
## 
## *DBIObject
##    |
##    |- *DBIDriver
##    |     |- ODBCDriver
##    |     |- PgSQLDriver
##    |     |- MySQLDriver
##    |     |- ...
##    |- *DBIConnection
##    |     |- ODBCConnection
##    |     |- PgSQLDConnection
##    |     |- MySQLDConnection
##    |     |- ....
##    |- *DBIResult
##          |  |- ODBCResult
##          |  |- PgSQLResult
##          |  |- MySQLResult
##          |  |- ...
##          |- *DBIResultSet    (NOTE: this has not been agreed upon)
##                |- ODBCResultSet
##                |- PgSQLResultSet
##                |- MySQLResultSet
##                |- ...
## 

##
## DBIObject and its methods (generics, to be more precise). This is
## the base class for all objects that implement R/S DBMS connectivity
##
setClass("DBIObject", "VIRTUAL")

## this is the main meta-data function; each DBI class should have
## this method return version info, and whatever other info is
## relevant (e.g., user, password(?), dbname for connections)
setGeneric("dbGetInfo", 
   def = function(dbObj, ...) standardGeneric("dbGetInfo")
)

## implementations may overload this method for all or some of its classes
setMethod("summary", "DBIObject", 
   definition = function(object, ...){
      info <- dbGetInfo(dbObj = object, ...)
      cat(class(object),"\n")
      print.list.pairs(info)
      invisible(info)
   }
)
      
##
## DBIDriver class and its methods.
##
## Should we define methods for querying the interface API to find what
## drivers are available on the current R/Splus instance?  Perhaps something 
## reminescent of library()?  DBIDriver() and DBIDriver(help = "RODBC"), say?
## (JDBC driver manager's class idea would be cleaner.)
##

setClass("DBIDriver", representation("DBIObject", "VIRTUAL"))

## The following function "loads" the specific "driver" or package, e.g.,
##     drv <- dbDriver("MySQL")
## Typically, drivers are expected to have a function of the same name
## that does the actual initialization, e.g., Oracle(), MySQL(), ODBC(),
## SQLite(), ....

setGeneric("dbDriver", 
   def = function(drvName, ...) standardGeneric("dbDriver"),
   valueClass = "DBIDriver")

setMethod("dbDriver", "character",
   definition = function(drvName, ...) {
      do.call(as.character(drvName), list(...))
   }
)
setGeneric("dbListConnections", 
   def = function(drv, ...) standardGeneric("dbListConnections")
)
setGeneric("dbUnloadDriver", 
   def = function(drv, ...) standardGeneric("dbUnloadDriver"),
   valueClass = "logical"
)

##
## DBIConnection class and methods
##
setClass("DBIConnection", representation("DBIObject", "VIRTUAL"))

## create a connection to the DBMS and return its handle object
setGeneric("dbConnect", 
   def = function(drv, ...) standardGeneric("dbConnect"),
   valueClass = "DBIConnection"
)
setGeneric("dbDisconnect", 
   def = function(conn, ...) standardGeneric("dbDisconnect"),
   valueClass = "logical"
)
## submit a statement to the DBMS, return the handle of the result object
setGeneric("dbSendQuery", 
   def = function(conn, statement, ...) standardGeneric("dbSendQuery"),
   valueClass = "DBIResult"
)
## submit, execute, and fetch a statement (all in one operation)
setGeneric("dbGetQuery", 
   def = function(conn, statement, ...) standardGeneric("dbGetQuery")
)
setGeneric("dbGetException",  
   def = function(conn, ...) standardGeneric("dbGetException")
)
## return a container with all result objects open in a connection
## (some implementation may only allow one open result set per connection)
setGeneric("dbListResults", 
   def = function(conn, ...) standardGeneric("dbListResults")
)

## Convenience DBIConnection functions, most return a logical
## to indicate whether the operation succeeded or not.
## These mimic objects(), get(), exists(), remove(), and assign(),
## and names()

setGeneric("dbListTables",
   def = function(conn, ...) standardGeneric("dbListTables"),
   valueClass = "character"
)
setGeneric("dbReadTable", 
   def = function(conn, name, ...) standardGeneric("dbReadTable"),
   valueClass = "data.frame"
)
setGeneric("dbWriteTable",
   def = function(conn, name, value, ...) standardGeneric("dbWriteTable"),
   valueClass = "logical"
)
setGeneric("dbExistsTable",
   def = function(conn, name, ...) standardGeneric("dbExistsTable"),
   valueClass = "logical"
)
setGeneric("dbRemoveTable",
   def = function(conn, name, ...) standardGeneric("dbRemoveTable"),
   valueClass = "logical"
)
## this is equivalent to names() on a remote table "name"
setGeneric("dbListFields", 
   def = function(conn, name, ...) standardGeneric("dbListFields"),
   valueClass = "character"
)

##
## data conversion
##
setGeneric("dbSetDataMappings", 
   def = function(res, flds, ...) standardGeneric("dbSetDataMappings"),
   valueClass = "logical"
)

##
## Transaction management 
##
setGeneric("dbCommit", 
   def = function(conn, ...) standardGeneric("dbCommit"),
   valueClass = "logical"
)
setGeneric("dbRollback", 
   def = function(conn, ...) standardGeneric("dbRollback"),
   valueClass = "logical"
)

##
## Stored procedures (untested)
##
setGeneric("dbCallProc", 
   def = function(conn, ...) standardGeneric("dbCallProc"),
   valueClass = "logical"
)

##
## Class: dbResult
## This is a base class for arbitrary results from the DBMS 
## Shoud we also define dbResultSets/dbCursors?
##
setClass("DBIResult", representation("DBIObject", "VIRTUAL"))

setGeneric("fetch", 
   def = function(res, n = -1, ...) standardGeneric("fetch"),
   valueClass = "data.frame"
)
## close remote result and free resource on both sides of the connection
setGeneric("dbClearResult", 
   def = function(res, ...) standardGeneric("dbClearResult"),
   valueClass = "logical"
)
## return a data.frame with columns describing the fields in the
## result (one row per result field).
setGeneric("dbColumnInfo", 
   def = function(res, ...) standardGeneric("dbColumnInfo"),
   valueClass = "data.frame"
)
setGeneric("dbGetStatement", 
   def = function(res, ...) standardGeneric("dbGetStatement"),
   valueClass = "character"
)
setGeneric("dbHasCompleted",
   def = function(res, ...) standardGeneric("dbHasCompleted"),
   valueClass = "logical"
)
setGeneric("dbGetRowsAffected",
   def = function(res, ...) standardGeneric("dbGetRowsAffected"),
   valueClass = "numeric"
)
setGeneric("dbGetRowCount",
   def = function(res, ...) standardGeneric("dbGetRowCount"),
   valueClass = "numeric"
)

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

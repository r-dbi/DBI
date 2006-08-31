## 
## $Id: setup.R,v 1.1 2002/08/23 19:38:43 dj Exp dj $ 
## the following is only needed during package installation,
## .First.lib() takes care during attaching....
.conflicts.OK <- TRUE
require(methods, quietly = TRUE, warn.conflicts = FALSE)

## $Id: DBI.R,v 1.7 2003/03/28 21:06:27 dj Exp dj $
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
if(!isGeneric("format")){
   setGeneric("format")
}
if(!isGeneric("print")){
   setGeneric("print")
}
if(!isGeneric("show")){
   setGeneric("show")
}
if(!isGeneric("summary")){
   setGeneric("summary")
}
## implementations may overload this method for all or some of its classes
setMethod("summary", "DBIObject", 
   def = function(object, ...){
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
   def = function(drvName, ...) {
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
## 
## $Id: Util.R,v 1.3 2002/08/24 20:26:33 dj Exp dj $
##
## Utilities.  These actually have been implemented by the DBI, 
## but individual driver could overload them;  for instance, the
## set of SQL keywords should be extended by the various packages.
##

"dbGetDBIVersion" <-
function()
{
   packageDescription("DBI", field="Version")
}

"print.list.pairs" <- function(x, ...)
{
   for(key in names(x)){
      value <- format(x[[key]])
      if(value=="") next
      cat(key, "=", value, "\n")  
   }
   invisible(x)
}
## return a string indicating the "closest" SQL type for an R/S object
setGeneric("dbDataType",
   def = function(dbObj, obj, ...) standardGeneric("dbDataType"),
   valueClass = "character"
)
## by defualt use the SQL92 data types -- individual drivers may need to
## overload this 
setMethod("dbDataType", signature(dbObj="DBIObject", obj="ANY"),
   def = function(dbObj, obj, ...) dbDataType.default(obj, ...),
   valueClass = "character"
)

"dbDataType.default" <-
function(obj, ...)
## find a suitable SQL data type for the R/S object obj
## (this method most likely should be overriden by each driver)
## TODO: Lots and lots!! (this is a very rough first draft)
{
   rs.class <- data.class(obj)
   rs.mode <- storage.mode(obj)
   if(rs.class=="numeric" || rs.class=="integer"){
      sql.type <- if(rs.mode=="integer") "int" else  "double precision"
   } 
   else {
      varchar <- function(x, width=0){
         nc <- ifelse(width>0, width, max(nchar(as.character(x))))
         paste("varchar(", nc, ")", sep="")
      }
      sql.type <- switch(rs.class,
                     logical = "smallint",
                     factor = , character = , ordered = , varchar(obj))
   }
   sql.type
}

## map R/S identifiers into SQL identifiers (careful with keywords)
setGeneric("make.db.names", 
   def = function(dbObj, snames, ...) standardGeneric("make.db.names"),
   valueClass = "character"
)
setMethod("make.db.names", signature(dbObj="DBIObject", snames="character"),
   def = function(dbObj, snames, ...) make.db.names.default(snames,...),
   valueClass = "character"
)

"make.db.names.default" <- 
function(snames, keywords = .SQL92Keywords, unique = T, allow.keywords = T)
## produce legal SQL identifiers from strings in a character vector
## unique, in this function, means unique regardless of lower/upper case
{
   "makeUnique" <- function(x, sep="_"){
      if(length(x)==0) return(x)
      out <- x
      lc <- make.names(tolower(x), unique=F)
      i <- duplicated(lc)
      lc <- make.names(lc, unique = T)
      out[i] <- paste(out[i], substring(lc[i], first=nchar(out[i])+1), sep=sep)
      out
   }
   ## Note: SQL identifiers *can* be enclosed in double or single quotes
   ## when they are equal to reserverd keywords.
   fc <- substring(snames, 1, 1)
   lc <- substring(snames, nchar(snames))
   i <- match(fc, c("'", '"'), 0)>0 & match(lc, c("'", '"'), 0)>0
   snames[!i]  <- make.names(snames[!i], unique=F)
   if(unique) 
      snames[!i] <- makeUnique(snames[!i])
   if(!allow.keywords){
      snames[!i] <- makeUnique(c(keywords, snames[!i]))[-seq(along = keywords)]
   } 
   gsub("\\.", "_", snames)
}

setGeneric("isSQLKeyword", 
   def = function(dbObj, name, ...) standardGeneric("isSQLKeyword"),
   valueClass = "logical"
)
setMethod("isSQLKeyword", signature(dbObj="DBIObject", name="character"),
   def = function(dbObj, name, ...) isSQLKeyword.default(name, ...),
   valueClass = "logical"
)

"isSQLKeyword.default" <-
function(name, keywords = .SQL92Keywords, case = c("lower", "upper", "any")[3])
{
   n <- pmatch(case, c("lower", "upper", "any"), nomatch=0)
   if(n==0)
      stop('case must be one of "lower", "upper", or "any"')
   kw <- switch(c("lower", "upper", "any")[n],
            lower = tolower(keywords),
            upper = toupper(keywords),
            any = toupper(keywords))
   if(n==3)
      name <- toupper(name)
   match(name, keywords, nomatch=0) > 0
}

## SQL ANSI 92 (plus ISO's) keywords --- all 220 of them!
## (See pp. 22 and 23 in X/Open SQL and RDA, 1994, isbn 1-872630-68-8)

setGeneric("SQLKeywords", 
   def = function(dbObj, ...)  standardGeneric("SQLKeywords"),
   valueClass = "character"
)
setMethod("SQLKeywords", "DBIObject", 
   def = function(dbObj, ...) .SQL92Keywords,
   valueClass = "character"
)
setMethod("SQLKeywords", "missing",
   def = function(dbObj, ...) .SQL92Keywords,
   valueClass = "character"
)
".SQL92Keywords" <- 
c("ABSOLUTE", "ADD", "ALL", "ALLOCATE", "ALTER", "AND", "ANY", "ARE", "AS",
   "ASC", "ASSERTION", "AT", "AUTHORIZATION", "AVG", "BEGIN", "BETWEEN",
   "BIT", "BIT_LENGTH", "BY", "CASCADE", "CASCADED", "CASE", "CAST", 
   "CATALOG", "CHAR", "CHARACTER", "CHARACTER_LENGTH", "CHAR_LENGTH",
   "CHECK", "CLOSE", "COALESCE", "COLLATE", "COLLATION", "COLUMN", 
   "COMMIT", "CONNECT", "CONNECTION", "CONSTRAINT", "CONSTRAINTS", 
   "CONTINUE", "CONVERT", "CORRESPONDING", "COUNT", "CREATE", "CURRENT",
   "CURRENT_DATE", "CURRENT_TIMESTAMP", "CURRENT_TYPE", "CURSOR", "DATE",
   "DAY", "DEALLOCATE", "DEC", "DECIMAL", "DECLARE", "DEFAULT", 
   "DEFERRABLE", "DEFERRED", "DELETE", "DESC", "DESCRIBE", "DESCRIPTOR",
   "DIAGNOSTICS", "DICONNECT", "DICTIONATRY", "DISPLACEMENT", "DISTINCT",
   "DOMAIN", "DOUBLE", "DROP", "ELSE", "END", "END-EXEC", "ESCAPE", 
   "EXCEPT", "EXCEPTION", "EXEC", "EXECUTE", "EXISTS", "EXTERNAL", 
   "EXTRACT", "FALSE", "FETCH", "FIRST", "FLOAT", "FOR", "FOREIGN", 
   "FOUND", "FROM", "FULL", "GET", "GLOBAL", "GO", "GOTO", "GRANT", 
   "GROUP", "HAVING", "HOUR", "IDENTITY", "IGNORE", "IMMEDIATE", "IN",
   "INCLUDE", "INDEX", "INDICATOR", "INITIALLY", "INNER", "INPUT", 
   "INSENSITIVE", "INSERT", "INT", "INTEGER", "INTERSECT", "INTERVAL",
   "INTO", "IS", "ISOLATION", "JOIN", "KEY", "LANGUAGE", "LAST", "LEFT",
   "LEVEL", "LIKE", "LOCAL", "LOWER", "MATCH", "MAX", "MIN", "MINUTE",
   "MODULE", "MONTH", "NAMES", "NATIONAL", "NCHAR", "NEXT", "NOT", "NULL",
   "NULLIF", "NUMERIC", "OCTECT_LENGTH", "OF", "OFF", "ONLY", "OPEN",
   "OPTION", "OR", "ORDER", "OUTER", "OUTPUT", "OVERLAPS", "PARTIAL",
   "POSITION", "PRECISION", "PREPARE", "PRESERVE", "PRIMARY", "PRIOR",
   "PRIVILEGES", "PROCEDURE", "PUBLIC", "READ", "REAL", "REFERENCES",
   "RESTRICT", "REVOKE", "RIGHT", "ROLLBACK", "ROWS", "SCHEMA", "SCROLL",
   "SECOND", "SECTION", "SELECT", "SET", "SIZE", "SMALLINT", "SOME", "SQL",
   "SQLCA", "SQLCODE", "SQLERROR", "SQLSTATE", "SQLWARNING", "SUBSTRING",
   "SUM", "SYSTEM", "TABLE", "TEMPORARY", "THEN", "TIME", "TIMESTAMP",
   "TIMEZONE_HOUR", "TIMEZONE_MINUTE", "TO", "TRANSACTION", "TRANSLATE",
   "TRANSLATION", "TRUE", "UNION", "UNIQUE", "UNKNOWN", "UPDATE", "UPPER",
   "USAGE", "USER", "USING", "VALUE", "VALUES", "VARCHAR", "VARYING",
   "VIEW", "WHEN", "WHENEVER", "WHERE", "WITH", "WORK", "WRITE", "YEAR",
   "ZONE"
   )
## $Id: zzz.R,v 1.3 2002/08/26 16:16:57 dj Exp dj $

.conflicts.OK <- TRUE
".First.lib" <- 
function(lib, pkg)
{
   require(methods, quietly = TRUE, warn.conflicts = FALSE)
}

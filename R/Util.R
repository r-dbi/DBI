## 
## $Id$
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
   definition = function(dbObj, obj, ...) dbDataType.default(obj, ...),
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
   signature=c("dbObj", "snames"),        
   def = function(dbObj, snames, keywords = .SQL92Keywords, unique = TRUE,
     allow.keywords = TRUE, ...) standardGeneric("make.db.names"),
   valueClass = "character"
)
setMethod("make.db.names", signature(dbObj="DBIObject", snames="character"),
   definition = function(dbObj, snames, keywords, unique, allow.keywords, ...) {
       make.db.names.default(snames, keywords, unique, allow.keywords)
       },
   valueClass = "character"
)

"make.db.names.default" <- 
function(snames, keywords = .SQL92Keywords, unique = TRUE,
         allow.keywords = TRUE)
## produce legal SQL identifiers from strings in a character vector
## unique, in this function, means unique regardless of lower/upper case
{
   "makeUnique" <- function(x, sep="_"){
      if(length(x)==0) return(x)
      out <- x
      lc <- make.names(tolower(x), unique=FALSE)
      i <- duplicated(lc)
      lc <- make.names(lc, unique = TRUE)
      out[i] <- paste(out[i], substring(lc[i], first=nchar(out[i])+1), sep=sep)
      out
   }
   ## Note: SQL identifiers *can* be enclosed in double or single quotes
   ## when they are equal to reserverd keywords.
   fc <- substring(snames, 1, 1)
   lc <- substring(snames, nchar(snames))
   i <- match(fc, c("'", '"'), 0)>0 & match(lc, c("'", '"'), 0)>0
   snames[!i]  <- make.names(snames[!i], unique=FALSE)
   if(unique) 
      snames[!i] <- makeUnique(snames[!i])
   if(!allow.keywords){
      kwi <- match(keywords, toupper(snames), nomatch = 0L)
      snames[kwi] <- paste('"', snames[kwi], '"', sep='')
   } 
   gsub("\\.", "_", snames)
}

setGeneric("isSQLKeyword",
   signature = c("dbObj", "name"),
   def = function(dbObj, name, keywords = .SQL92Keywords,
                  case = c("lower", "upper", "any")[3], ...) {
       standardGeneric("isSQLKeyword")
       },
   valueClass = "logical"
)
setMethod("isSQLKeyword", signature(dbObj="DBIObject", name="character"),
   definition = function(dbObj, name, keywords, case, ...)
          isSQLKeyword.default(name, keywords, case),
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
   definition = function(dbObj, ...) .SQL92Keywords,
   valueClass = "character"
)
setMethod("SQLKeywords", "missing",
   definition = function(dbObj, ...) .SQL92Keywords,
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

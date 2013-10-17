#' @include DBObject.R

#' @export
setClass("DBIDriver", representation("DBIObject", "VIRTUAL"))

## The following function "loads" the specific "driver" or package, e.g.,
##     drv <- dbDriver("MySQL")
## Typically, drivers are expected to have a function of the same name
## that does the actual initialization, e.g., Oracle(), MySQL(), ODBC(),
## SQLite(), ....

#' @export
setGeneric("dbDriver", 
  def = function(drvName, ...) standardGeneric("dbDriver"),
  valueClass = "DBIDriver")

setMethod("dbDriver", "character",
  definition = function(drvName, ...) {
    do.call(as.character(drvName), list(...))
  }
)
#' @export
setGeneric("dbListConnections", 
  def = function(drv, ...) standardGeneric("dbListConnections")
)
#' @export
setGeneric("dbUnloadDriver", 
  def = function(drv, ...) standardGeneric("dbUnloadDriver"),
  valueClass = "logical"
)

## return a string indicating the "closest" SQL type for an R/S object
#' @export
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

## find a suitable SQL data type for the R/S object obj
## (this method most likely should be overriden by each driver)
## TODO: Lots and lots!! (this is a very rough first draft)
dbDataType.default <- function(obj, ...) {  
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

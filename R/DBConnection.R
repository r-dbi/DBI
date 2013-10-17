#' @include DBObject.R

##
## DBIConnection class and methods
##
#' @export
setClass("DBIConnection", representation("DBIObject", "VIRTUAL"))

## create a connection to the DBMS and return its handle object
#' @export
setGeneric("dbConnect", 
  def = function(drv, ...) standardGeneric("dbConnect"),
  valueClass = "DBIConnection"
)
#' @export
setGeneric("dbDisconnect", 
  def = function(conn, ...) standardGeneric("dbDisconnect"),
  valueClass = "logical"
)
## submit a statement to the DBMS, return the handle of the result object
#' @export
setGeneric("dbSendQuery", 
  def = function(conn, statement, ...) standardGeneric("dbSendQuery"),
  valueClass = "DBIResult"
)
## submit, execute, and fetch a statement (all in one operation)
#' @export
setGeneric("dbGetQuery", 
  def = function(conn, statement, ...) standardGeneric("dbGetQuery")
)
#' @export
setGeneric("dbGetException",  
  def = function(conn, ...) standardGeneric("dbGetException")
)
## return a container with all result objects open in a connection
## (some implementation may only allow one open result set per connection)
#' @export
setGeneric("dbListResults", 
  def = function(conn, ...) standardGeneric("dbListResults")
)

## Convenience DBIConnection functions, most return a logical
## to indicate whether the operation succeeded or not.
## These mimic objects(), get(), exists(), remove(), and assign(),
## and names()

#' @export
setGeneric("dbListTables",
  def = function(conn, ...) standardGeneric("dbListTables"),
  valueClass = "character"
)
#' @export
setGeneric("dbReadTable", 
  def = function(conn, name, ...) standardGeneric("dbReadTable"),
  valueClass = "data.frame"
)
setGeneric("dbWriteTable",
  def = function(conn, name, value, ...) standardGeneric("dbWriteTable"),
  valueClass = "logical"
)
#' @export
setGeneric("dbExistsTable",
  def = function(conn, name, ...) standardGeneric("dbExistsTable"),
  valueClass = "logical"
)
#' @export
setGeneric("dbRemoveTable",
  def = function(conn, name, ...) standardGeneric("dbRemoveTable"),
  valueClass = "logical"
)
## this is equivalent to names() on a remote table "name"
#' @export
setGeneric("dbListFields", 
  def = function(conn, name, ...) standardGeneric("dbListFields"),
  valueClass = "character"
)

##
## data conversion
##
#' @export
setGeneric("dbSetDataMappings", 
  def = function(res, flds, ...) standardGeneric("dbSetDataMappings"),
  valueClass = "logical"
)

##
## Transaction management 
##
#' @export
setGeneric("dbCommit", 
  def = function(conn, ...) standardGeneric("dbCommit"),
  valueClass = "logical"
)
#' @export
setGeneric("dbRollback", 
  def = function(conn, ...) standardGeneric("dbRollback"),
  valueClass = "logical"
)

##
## Stored procedures (untested)
##
#' @export
setGeneric("dbCallProc", 
  def = function(conn, ...) standardGeneric("dbCallProc"),
  valueClass = "logical"
)
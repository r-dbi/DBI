#' @include DBObject.R

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

#' @include DBObject.R
## Class: DBIResult
## This is a base class for arbitrary results from the DBMS 

#' @export
setClass("DBIResult", representation("DBIObject", "VIRTUAL"))

#' @export
setGeneric("fetch", 
  def = function(res, n = -1, ...) standardGeneric("fetch"),
  valueClass = "data.frame"
)
## close remote result and free resource on both sides of the connection
#' @export
setGeneric("dbClearResult", 
  def = function(res, ...) standardGeneric("dbClearResult"),
  valueClass = "logical"
)
## return a data.frame with columns describing the fields in the
## result (one row per result field).
#' @export
setGeneric("dbColumnInfo", 
  def = function(res, ...) standardGeneric("dbColumnInfo"),
  valueClass = "data.frame"
)
#' @export
setGeneric("dbGetStatement", 
  def = function(res, ...) standardGeneric("dbGetStatement"),
  valueClass = "character"
)
#' @export
setGeneric("dbHasCompleted",
  def = function(res, ...) standardGeneric("dbHasCompleted"),
  valueClass = "logical"
)
#' @export
setGeneric("dbGetRowsAffected",
  def = function(res, ...) standardGeneric("dbGetRowsAffected"),
  valueClass = "numeric"
)
#' @export
setGeneric("dbGetRowCount",
  def = function(res, ...) standardGeneric("dbGetRowCount"),
  valueClass = "numeric"
)

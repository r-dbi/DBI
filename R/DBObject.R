#' DBIObject class.
#' 
#' Base class for all other DBI classes (e.g., drivers, connections). This
#' is a virtual Class: No objects may be created from it.
#' 
#' @docType class
#' @family DBI classes
#' @examples
#' \dontrun{
#' drv <- dbDriver("MySQL")
#' con <- dbConnect(drv, group = "rs-dbi")
#' res <- dbSendQuery(con, "select * from vitalSuite")
#' is(drv, "DBIObject")   ## True
#' is(con, "DBIObject")   ## True
#' is(res, "DBIObject")
#' }
#' @export
#' @name DBIObject-class
setClass("DBIObject", "VIRTUAL")

#' Get DBMS metadata.
#' 
#' @section Implementation notes:
#' For \code{DBIDriver} subclasses, this should include the version of the 
#' package, and the version of the underlying client library. 
#' 
#' For \code{DBIConnection} objects this should report the version of 
#' the DBMS engine, database name, username, host, port, etc. It MUST NOT
#' include the password. 
#' 
#' For \code{DBIResult} objects, this should include the statement
#' being executed, how many rows have been fetched so far (in the case of
#' queries), how many rows were affected (deleted, inserted, changed, or total
#' number of records to be fetched).
#' 
#' @param dbObj An object inheriting from \code{\linkS4class{DBIObject}}, 
#'  i.e. \code{\linkS4class{DBIDriver}}, \code{\linkS4class{DBIConnection}},
#'  or a \code{\linkS4class{DBIResult}}
#' @param ... Other arguments to methods.
#' @return a list
#' @export
setGeneric("dbGetInfo", 
   def = function(dbObj, ...) standardGeneric("dbGetInfo")
)

setGeneric("summary")
setMethod("summary", "DBIObject", function(object, ...) {
  info <- dbGetInfo(dbObj = object, ...)
  cat(class(object), "\n")
  print.list.pairs(info)
  invisible(info)
})

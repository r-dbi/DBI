#' DBIObject class.
#' 
#' Base class for all other DBI classes (e.g., drivers, connections). This
#' is a virtual Class: No objects may be created from it.
#' 
#' More generally, the DBI defines a very small set of classes and methods that
#' allows users and applications access DBMS with a common interface.  The
#' virtual classes are \code{DBIDriver} that individual drivers extend,
#' \code{DBIConnection} that represent instances of DBMS connections, and
#' \code{DBIResult} that represent the result of a DBMS statement.  These three
#' classes extend the basic class of \code{DBIObject}, which serves as the root
#' or parent of the class hierarchy.
#' 
#' @section Implementation notes:
#' An implementation MUST provide methods for the following generics:
#' 
#' \itemize{
#'   \item \code{\link{dbGetInfo}}. 
#' }
#' 
#' It MAY also provide methods for:
#' 
#' \itemize{
#'   \item \code{\link{summary}}. Print a concise description of the 
#'     object. The default method invokes \code{dbGetInfo(dbObj)} and prints 
#'     the name-value pairs one per line.  Individual implementations may 
#'     tailor this appropriately.
#' }
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
#' package (\code{driver.version}), the version of the underlying client 
#' library (\code{client.version}), and the maximum number of connections
#' (\code{max.connections}).
#' 
#' For \code{DBIConnection} objects this should report the version of 
#' the DBMS engine (\code{db.version}), database name (\code{dbname}),
#' username, (\code{username}), host (\code{host}), port (\code{port}), etc. 
#' It MAY also include any other arguments related to the connection 
#' (e.g., thread id, socket or TCP connection type). It MUST NOT include the 
#' password. 
#' 
#' For \code{DBIResult} objects, this should include the statement
#' being executed (\code{statement}), how many rows have been fetched so far 
#' (in the case of queries) (\code{row.count}), how many rows were affected 
#' (deleted, inserted, changed, or total number of records to be fetched).
#' (\code{rows.affected}), if the query is complete (\code{has.completed}),
#' and whether or not the query generates output (\code{is.select}).
#' 
#' @param dbObj An object inheriting from \code{\linkS4class{DBIObject}}, 
#'  i.e. \code{\linkS4class{DBIDriver}}, \code{\linkS4class{DBIConnection}},
#'  or a \code{\linkS4class{DBIResult}}
#' @param ... Other arguments to methods.
#' @family DBObject methods
#' @return a named list
#' @export
setGeneric("dbGetInfo", 
   def = function(dbObj, ...) standardGeneric("dbGetInfo")
)

#' Is this DBMS object still valid?
#' 
#' This generic tests whether a database object is still valid (i.e. it hasn't
#' been disconnected or cleared).
#' 
#' @inheritParams dbGetInfo
#' @return a logical of length 1
#' @family DBObject methods
#' @export
setGeneric("dbIsValid", 
  def = function(dbObj, ...) standardGeneric("dbIsValid"),
  valueClass = "logical")

setGeneric("summary")
setMethod("summary", "DBIObject", function(object, ...) {
  info <- dbGetInfo(dbObj = object, ...)
  cat(class(object), "\n")
  print.list.pairs(info)
  invisible(info)
})

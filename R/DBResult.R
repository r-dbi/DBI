#' DBIResult class.
#' 
#' Base class for all DBMS-specific result objects. This is a virtual class: 
#' No objects may be created from it.
#' 
#' @name DBIResult-class
#' @docType class
#' @family DBI classes
#' @examples
#' \dontrun{
#'  drv <- dbDriver("Oracle")
#'  con <- dbConnect(drv, "user/password@@dbname")
#'  res <- dbSendQuery(con, "select * from LASERS where prdata > '2002-05-01'")
#'  summary(res)
#'  while(dbHasCompleted(res)){
#'     chunk <- fetch(res, n = 1000)
#'     process(chunk)
#'  }
#' }
#' @export
#' @include DBObject.R
setClass("DBIResult", representation("DBIObject", "VIRTUAL"))

#' Fetch records from a previously executed query.
#' 
#' See the notes for the various database server implementations.
#' 
#' \code{dbClearResult} frees all resources (local and remote) associated with
#' a result set.  It some cases (e.g., very large result sets) this can be a
#' critical step to avoid exhausting resources (memory, file descriptors, etc.)
#' 
#' @param res a result set object (one whose class extends \code{DBIResult}).
#'   This object needs to be the result of a statement that produces output, 
#'   such as SQL's \code{SELECT} or \code{SELECT}-like statement, this object
#'   \code{res} is typically produced by a call to or \code{dbSendQuery}.
#' @param n maximum number of records to retrieve per fetch.  Use \code{n = -1}
#'   to retrieve all pending records.  Some implementations may recognize other
#'   special values.
#' @param ... any other database-engine specific arguments.
#' @return \code{fetch}: a data.frame with as many rows as records were fetched and as many
#'   columns as fields in the result set.
#'   
#'   \code{dbClearResult} returns a logical indicating whether clearing the
#'   result set was successful or not.
#' @note Make sure you close the result set with \code{\link{dbClearResult}} as
#' soon as you finish retrieving the records you want.
#' @section Side Effects: As the R/Splus client fetches records the remote
#'   database server updates its cursor accordingly.
#' @family DBIResult generics
#' @examples
#' \dontrun{
#' # Run an SQL statement by creating first a resultSet object
#' drv <- dbDriver("ODBC")
#' con <- dbConnect(drv, ...)
#' res <- dbSendQuery(con, statement = paste(
#'                       "SELECT w.laser_id, w.wavelength, p.cut_off",
#'                       "FROM WL w, PURGE P", 
#'                       "WHERE w.laser_id = p.laser_id",
#'                       "ORDER BY w.laser_id"))
#' # we now fetch the first 100 records from the resultSet into a data.frame
#' data1 <- fetch(res, n = 100)   
#' dim(data1)
#' 
#' dbHasCompleted(res)
#' 
#' # let's get all remaining records
#' data2 <- fetch(res, n = -1)
#' }
#' @export
setGeneric("fetch", 
  def = function(res, n = -1, ...) standardGeneric("fetch"),
  valueClass = "data.frame"
)

#' @export
#' @rdname fetch
setGeneric("dbClearResult", 
  def = function(res, ...) standardGeneric("dbClearResult"),
  valueClass = "logical"
)

#' Information about result types.
#' 
#' @param res An object inheriting from \code{\linkS4class{DBIResult}}.
#' @param ... Other arguments passed on to methods.
#' @return A data.frame with one row per output field in \code{res}. Methods 
#'   MUST include \code{name} and \code{type} columns, and MAY contain other
#'   database specific information like scale and precision or whether the 
#'   field can store \code{NULL}s.
#' @family DBIResult generics
#' @export
setGeneric("dbColumnInfo", 
  def = function(res, ...) standardGeneric("dbColumnInfo"),
  valueClass = "data.frame"
)

#' Get the statement associated with a result set
#' 
#' @param res An object inheriting from \code{\linkS4class{DBIResult}}.
#' @param ... Other arguments passed on to methods.
#' @return a character vector
#' @family DBIResult generics
#' @export
setGeneric("dbGetStatement", 
  def = function(res, ...) standardGeneric("dbGetStatement"),
  valueClass = "character"
)

#' Has the operation completed?
#' 
#' @param res An object inheriting from \code{\linkS4class{DBIResult}}.
#' @param ... Other arguments passed on to methods.
#' @return a logical vector of length 1
#' @family DBIResult generics
#' @export
setGeneric("dbHasCompleted",
  def = function(res, ...) standardGeneric("dbHasCompleted"),
  valueClass = "logical"
)

#' The number of rows affected by data modifying query.
#' 
#' @param res An object inheriting from \code{\linkS4class{DBIResult}}.
#' @param ... Other arguments passed on to methods.
#' @return a numeric vector of length 1
#' @family DBIResult generics
#' @export
setGeneric("dbGetRowsAffected",
  def = function(res, ...) standardGeneric("dbGetRowsAffected"),
  valueClass = "numeric"
)

#' The number of rows fetched so far.
#' 
#' @param res An object inheriting from \code{\linkS4class{DBIResult}}.
#' @param ... Other arguments passed on to methods.
#' @return a numeric vector of length 1
#' @family DBIResult generics
#' @export
setGeneric("dbGetRowCount",
  def = function(res, ...) standardGeneric("dbGetRowCount"),
  valueClass = "numeric"
)

#' Set data mappings between an DBMS and R/Splus.
#' 
#' NOT YET IMPLEMENTED.
#' 
#' Sets one or more conversion functions to handle the translation of DBMS data
#' types to R/Splus objects.  This is only needed for non-primitive data, since
#' all DBI drivers handle the common base types (integers, numeric, strings,
#' etc.)
#' 
#' The details on conversion functions (e.g., arguments, whether they can
#' invoke initializers and/or destructors) have not been specified.
#' 
#' @param res An object inheriting from \code{\linkS4class{DBIResult}}.
#' @param ... Other arguments passed on to methods.
#' @keywords internal
#' @param flds a field description object as returned by \code{dbColumnInfo}.
#' @examples
#' \dontrun{
#' makeImage <- function(x) {
#'   .C("make_Image", as.integer(x), length(x))
#' }
#' 
#' res <- dbSendQuery(con, statement)
#' flds <- dbColumnInfo(res)
#' flds[3, "Sclass"] <- makeImage
#' 
#' dbSetDataMappings(rs, flds)
#' 
#' im <- fetch(rs, n = -1)
#' }
#' @export
setGeneric("dbSetDataMappings", 
  def = function(res, flds, ...) standardGeneric("dbSetDataMappings"),
  valueClass = "logical"
)

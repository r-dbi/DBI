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
#' \code{fetch} is provided for compatibility with older DBI clients - for all
#' new code you are strongly encouraged to use \code{dbFetch}. The default 
#' method for \code{dbFetch} calls \code{fetch} so that it is compatible with
#' existing code. Implementors should provide methods for both \code{fetch}
#' and \code{dbFetch} until \code{fetch} is deprecated in 2015.
#' 
#' @aliases dbFetch,DBIResult-method
#' @param res An object inheriting from \code{\linkS4class{DBIResult}}.
#' @param n maximum number of records to retrieve per fetch. Use \code{n = -1}
#'   to retrieve all pending records.  Some implementations may recognize other
#'   special values.
#' @param ... Other arguments passed on to methods.
#' @return a data.frame with as many rows as records were fetched and as many
#'   columns as fields in the result set.
#' @seealso close the result set with \code{\link{dbClearResult}} as
#'   soon as you finish retrieving the records you want.
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
#' data2 <- dbFetch(res, n = -1)
#' }
#' @export
setGeneric("dbFetch", 
  def = function(res, n = -1, ...) standardGeneric("dbFetch"),
  valueClass = "data.frame"
)

setMethod("dbFetch", "DBIResult", function(res, n = -1, ...) {
  fetch(res, n = n, ...)
})

#' @rdname dbFetch
#' @export
setGeneric("fetch", 
  def = function(res, n = -1, ...) standardGeneric("fetch"),
  valueClass = "data.frame"
)


#' Clear a result set.
#' 
#' Frees all resources (local and remote) associated with
#' a result set.  It some cases (e.g., very large result sets) this can be a
#' critical step to avoid exhausting resources (memory, file descriptors, etc.)
#' 
#' @param res An object inheriting from \code{\linkS4class{DBIResult}}.
#' @param ... Other arguments passed on to methods.
#' @return a logical indicating whether clearing the
#'   result set was successful or not.
#' @family DBIResult generics
#' @export
setGeneric("dbClearResult", 
  def = function(res, ...) standardGeneric("dbClearResult"),
  valueClass = "logical"
)

#' Information about result types.
#' 
#' @inheritParams dbClearResult
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
#' @inheritParams dbClearResult
#' @return a character vector
#' @family DBIResult generics
#' @export
setGeneric("dbGetStatement", 
  def = function(res, ...) standardGeneric("dbGetStatement"),
  valueClass = "character"
)

#' Has the operation completed?
#' 
#' @inheritParams dbClearResult
#' @return a logical vector of length 1
#' @family DBIResult generics
#' @export
setGeneric("dbHasCompleted",
  def = function(res, ...) standardGeneric("dbHasCompleted"),
  valueClass = "logical"
)

#' The number of rows affected by data modifying query.
#' 
#' @inheritParams dbClearResult
#' @return a numeric vector of length 1
#' @family DBIResult generics
#' @export
setGeneric("dbGetRowsAffected",
  def = function(res, ...) standardGeneric("dbGetRowsAffected"),
  valueClass = "numeric"
)

#' The number of rows fetched so far.
#' 
#' @inheritParams dbClearResult
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
#' @inheritParams dbClearResult
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

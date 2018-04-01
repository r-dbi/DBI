#' @include hidden.R
NULL

#' DBIObject class
#'
#' Base class for all other DBI classes (e.g., drivers, connections). This
#' is a virtual Class: No objects may be created from it.
#'
#' More generally, the DBI defines a very small set of classes and generics that
#' allows users and applications access DBMS with a common interface.  The
#' virtual classes are `DBIDriver` that individual drivers extend,
#' `DBIConnection` that represent instances of DBMS connections, and
#' `DBIResult` that represent the result of a DBMS statement.  These three
#' classes extend the basic class of `DBIObject`, which serves as the root
#' or parent of the class hierarchy.
#'
#' @section Implementation notes:
#' An implementation MUST provide methods for the following generics:
#'
#' \itemize{
#'   \item [dbGetInfo()].
#' }
#'
#' It MAY also provide methods for:
#'
#' \itemize{
#'   \item [summary()]. Print a concise description of the
#'     object. The default method invokes `dbGetInfo(dbObj)` and prints
#'     the name-value pairs one per line.  Individual implementations may
#'     tailor this appropriately.
#' }
#'
#' @docType class
#' @family DBI classes
#' @examples
#' drv <- RSQLite::SQLite()
#' con <- dbConnect(drv)
#'
#' rs <- dbSendQuery(con, "SELECT 1")
#' is(drv, "DBIObject")   ## True
#' is(con, "DBIObject")   ## True
#' is(rs, "DBIObject")
#'
#' dbClearResult(rs)
#' dbDisconnect(con)
#' @export
#' @name DBIObject-class
setClass("DBIObject", "VIRTUAL")

#' Get DBMS metadata
#'
#' @section Implementation notes:
#' For `DBIDriver` subclasses, this should include the version of the
#' package (`driver.version`) and the version of the underlying client
#' library (`client.version`).
#'
#' For `DBIConnection` objects this should report the version of
#' the DBMS engine (`db.version`), database name (`dbname`),
#' username, (`username`), host (`host`), port (`port`), etc.
#' It MAY also include any other arguments related to the connection
#' (e.g., thread id, socket or TCP connection type). It MUST NOT include the
#' password.
#'
#' For `DBIResult` objects, this should include the statement
#' being executed (`statement`), how many rows have been fetched so far
#' (in the case of queries, `row.count`), how many rows were affected
#' (deleted, inserted, changed,
#' (`rows.affected`), and if the query is complete (`has.completed`).
#'
#' @param dbObj An object inheriting from [DBIObject-class],
#'  i.e. [DBIDriver-class], [DBIConnection-class],
#'  or a [DBIResult-class]
#' @param ... Other arguments to methods.
#' @family DBIDriver generics
#' @family DBIConnection generics
#' @family DBIResult generics
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
#' @template methods
#' @templateVar method_name dbIsValid
#'
#' @inherit DBItest::spec_meta_is_valid return
#'
#' @inheritParams dbGetInfo
#' @family DBIDriver generics
#' @family DBIConnection generics
#' @family DBIResult generics
#' @export
#' @examples
#' dbIsValid(RSQLite::SQLite())
#'
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#' dbIsValid(con)
#'
#' rs <- dbSendQuery(con, "SELECT 1")
#' dbIsValid(rs)
#'
#' dbClearResult(rs)
#' dbIsValid(rs)
#'
#' dbDisconnect(con)
#' dbIsValid(con)
setGeneric("dbIsValid",
  def = function(dbObj, ...) standardGeneric("dbIsValid"),
  valueClass = "logical"
)

#' Is this DBMS object read only?
#'
#' This generic tests whether a database object is read only.
#'
#' @inheritParams dbGetInfo
#' @family DBIDriver generics
#' @family DBIConnection generics
#' @family DBIResult generics
#' @export
#' @examples
#' dbIsReadOnly(ANSI())
setGeneric("dbIsReadOnly",
  def = function(dbObj, ...) standardGeneric("dbIsReadOnly"),
  valueClass = "logical")

#' @rdname hidden_aliases
setMethod("dbIsReadOnly", "DBIObject", function(dbObj, ...) {
  FALSE
})

setGeneric("summary")
setMethod("summary", "DBIObject", function(object, ...) {
  info <- dbGetInfo(dbObj = object, ...)
  cat(class(object), "\n")
  print_list_pairs(info)
  invisible(info)
})

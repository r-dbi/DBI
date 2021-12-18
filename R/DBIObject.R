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

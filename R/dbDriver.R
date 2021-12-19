#' Load and unload database drivers
#'
#' @description
#' These methods are deprecated, please consult the documentation of the
#' individual backends for the construction of driver instances.
#'
#' `dbDriver()` is a helper method used to create an new driver object
#' given the name of a database or the corresponding R package. It works
#' through convention: all DBI-extending packages should provide an exported
#' object with the same name as the package. `dbDriver()` just looks for
#' this object in the right places: if you know what database you are connecting
#' to, you should call the function directly.
#'
#' @details
#' The client part of the database communication is
#' initialized (typically dynamically loading C code, etc.) but note that
#' connecting to the database engine itself needs to be done through calls to
#' `dbConnect`.
#'
#' @param drvName character name of the driver to instantiate.
#' @param drv an object that inherits from `DBIDriver` as created by
#'   `dbDriver`.
#' @param ... any other arguments are passed to the driver `drvName`.
#' @return In the case of `dbDriver`, an driver object whose class extends
#'   `DBIDriver`. This object may be used to create connections to the
#'   actual DBMS engine.
#'
#'   In the case of `dbUnloadDriver`, a logical indicating whether the
#'   operation succeeded or not.
#' @import methods
#' @family DBIDriver generics
#' @export
#' @keywords internal
#' @examples
#' # Create a RSQLite driver with a string
#' d <- dbDriver("SQLite")
#' d
#'
#' # But better, access the object directly
#' RSQLite::SQLite()
setGeneric("dbDriver",
  def = function(drvName, ...) standardGeneric("dbDriver"),
  valueClass = "DBIDriver"
)

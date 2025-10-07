#' Determine the SQL data type of an object
#'
#' Returns an SQL string that describes the SQL data type to be used for an
#' object.
#' The default implementation of this generic determines the SQL type of an
#' R object according to the SQL 92 specification, which may serve as a starting
#' point for driver implementations. DBI also provides an implementation
#' for data.frame which will return a character vector giving the type for each
#' column in the dataframe.
#'
#' The data types supported by databases are different than the data types in R,
#' but the mapping between the primitive types is straightforward:
#' - Any of the many fixed and varying length character types are mapped to
#'   character vectors
#' - Fixed-precision (non-IEEE) numbers are mapped into either numeric or
#'   integer vectors.
#'
#' Notice that many DBMS do not follow IEEE arithmetic, so there are potential
#' problems with under/overflows and loss of precision.
#'
#' @template methods
#' @templateVar method_name dbDataType
#'
#' @inherit DBItest::spec_driver_data_type return
#' @inheritSection DBItest::spec_driver_data_type Failure modes
#' @inheritSection DBItest::spec_driver_data_type Specification
#' @inheritSection DBItest::spec_result_create_table_with_data_type Specification
#'
#' @inheritParams dbListConnections
#' @param dbObj A object inheriting from [DBI::DBIDriver][DBIDriver-class]
#'   or [DBI::DBIConnection][DBIConnection-class]
#' @param obj An R object whose SQL type we want to determine.
#' @family DBIDriver generics
#' @family DBIConnection generics
#' @family DBIConnector generics
#' @examples
#' dbDataType(ANSI(), 1:5)
#' dbDataType(ANSI(), 1)
#' dbDataType(ANSI(), TRUE)
#' dbDataType(ANSI(), Sys.Date())
#' dbDataType(ANSI(), Sys.time())
#' dbDataType(ANSI(), Sys.time() - as.POSIXct(Sys.Date()))
#' dbDataType(ANSI(), c("x", "abc"))
#' dbDataType(ANSI(), list(raw(10), raw(20)))
#' dbDataType(ANSI(), I(3))
#'
#' dbDataType(ANSI(), iris)
#' @examplesIf requireNamespace("RSQLite", quietly = TRUE)
#'
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbDataType(con, 1:5)
#' dbDataType(con, 1)
#' dbDataType(con, TRUE)
#' dbDataType(con, Sys.Date())
#' dbDataType(con, Sys.time())
#' dbDataType(con, Sys.time() - as.POSIXct(Sys.Date()))
#' dbDataType(con, c("x", "abc"))
#' dbDataType(con, list(raw(10), raw(20)))
#' dbDataType(con, I(3))
#'
#' dbDataType(con, iris)
#'
#' dbDisconnect(con)
#' @export
setGeneric(
  "dbDataType",
  def = function(dbObj, obj, ...) standardGeneric("dbDataType"),
  valueClass = "character"
)

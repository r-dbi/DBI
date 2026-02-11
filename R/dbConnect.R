#' Create a connection to a DBMS
#'
#' Connect to a DBMS going through the appropriate authentication procedure.
#' Some implementations may allow you to have multiple connections open, so you
#' may invoke this function repeatedly assigning its output to different
#' objects.
#' The authentication mechanism is left unspecified, so check the
#' documentation of individual drivers for details.
#' Use [dbCanConnect()] to check if a connection can be established.
#'
#' @template methods
#' @templateVar method_name dbConnect
#'
#' @inherit DBItest::spec_driver_connect return
#' @inheritSection DBItest::spec_driver_connect Specification
#'
#' @param drv An object that inherits from [DBI::DBIDriver][DBIDriver-class],
#'   or an existing [DBI::DBIConnection][DBIConnection-class]
#'   object (in order to clone an existing connection).
#' @param ... Authentication arguments needed by the DBMS instance; these
#'   typically include `user`, `password`, `host`, `port`, `dbname`, etc.
#'   For details see the appropriate `DBIDriver`.
#' @seealso [dbDisconnect()] to disconnect from a database.
#' @family DBIDriver generics
#' @family DBIConnector generics
#' @export
#' @examplesIf requireNamespace("RSQLite", quietly = TRUE)
#' # SQLite only needs a path to the database. (Here, ":memory:" is a special
#' # path that creates an in-memory database.) Other database drivers
#' # will require more details (like user, password, host, port, etc.)
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#' con
#'
#' dbListTables(con)
#'
#' dbDisconnect(con)
#'
#' # Bad, for subtle reasons:
#' # This code fails when RSQLite isn't loaded yet,
#' # because dbConnect() doesn't know yet about RSQLite.
#' dbListTables(con <- dbConnect(RSQLite::SQLite(), ":memory:"))
setGeneric(
  "dbConnect",
  def = function(drv, ...) {
    otel_local_active_span("dbConnect", drv)
    standardGeneric("dbConnect")
  },
  valueClass = "DBIConnection"
)

#' List remote objects
#'
#' Returns the names of remote objects accessible through this connection
#' as a data frame.
#' This should include temporary objects, but not all database backends
#' (in particular \pkg{RMariaDB} and \pkg{RMySQL}) support this.
#' Compared to [dbListTables()], this method also enumerates tables and views
#' in schemas, and returns fully qualified identifiers to access these objects.
#' This allows exploration of all database objects available to the current
#' user, including those that can only be accessed by giving the full
#' namespace.
#'
#' @template methods
#' @templateVar method_name dbListObjects
#'
#' @inherit DBItest::spec_sql_list_objects return
#' @inheritSection DBItest::spec_sql_list_objects Failure modes
#' @inheritSection DBItest::spec_sql_list_objects Specification
#'
#' @inheritParams dbGetQuery
#' @param prefix A fully qualified path in the database's namespace, or `NULL`.
#'   This argument will be processed with [dbUnquoteIdentifier()].
#'   If given the method will return all objects accessible through this prefix.
#' @family DBIConnection generics
#' @export
#' @examplesIf requireNamespace("RSQLite", quietly = TRUE)
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbListObjects(con)
#' dbWriteTable(con, "mtcars", mtcars)
#' dbListObjects(con)
#'
#' dbDisconnect(con)
setGeneric("dbListObjects",
  def = function(conn, prefix = NULL, ...) standardGeneric("dbListObjects"),
  valueClass = "data.frame"
)

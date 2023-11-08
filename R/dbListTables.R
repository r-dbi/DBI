#' List remote tables
#'
#' Returns the unquoted names of remote tables accessible through this
#' connection.
#' This should include views and temporary objects, but not all database backends
#' (in particular \pkg{RMariaDB} and \pkg{RMySQL}) support this.
#'
#' @template methods
#' @templateVar method_name dbListTables
#'
#' @inherit DBItest::spec_sql_list_tables return
#' @inheritSection DBItest::spec_sql_list_tables Failure modes
#'
#' @inheritParams dbGetQuery
#' @family DBIConnection generics
#' @export
#' @examplesIf requireNamespace("RSQLite", quietly = TRUE)
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbListTables(con)
#' dbWriteTable(con, "mtcars", mtcars)
#' dbListTables(con)
#'
#' dbDisconnect(con)
setGeneric("dbListTables",
  def = function(conn, ...) standardGeneric("dbListTables"),
  valueClass = "character"
)

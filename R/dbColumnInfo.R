#' Information about result types
#'
#' Produces a data.frame that describes the output of a query. The data.frame
#' should have as many rows as there are output fields in the result set, and
#' each column in the data.frame describes an aspect of the result set
#' field (field name, type, etc.)
#'
#' @inheritSection dbBind The data retrieval flow
#'
#' @inheritParams dbClearResult
#'
#' @template methods
#' @templateVar method_name dbColumnInfo
#'
#' @inherit DBItest::spec_meta_column_info return
#' @inheritSection DBItest::spec_meta_column_info Failure modes
#' @inheritSection DBItest::spec_meta_column_info Specification
#'
#' @family DBIResult generics
#' @export
#' @examplesIf requireNamespace("RSQLite", quietly = TRUE)
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' rs <- dbSendQuery(con, "SELECT 1 AS a, 2 AS b")
#' dbColumnInfo(rs)
#' dbFetch(rs)
#'
#' dbClearResult(rs)
#' dbDisconnect(con)
setGeneric(
  "dbColumnInfo",
  def = function(res, ...) standardGeneric("dbColumnInfo"),
  valueClass = "data.frame"
)

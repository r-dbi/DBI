#' The number of rows affected
#'
#' This method returns the number of rows that were added, deleted, or updated
#' by a data manipulation statement.
#'
#' @inheritSection dbBind The command execution flow
#'
#' @template methods
#' @templateVar method_name dbGetRowsAffected
#'
#' @inherit DBItest::spec_meta_get_rows_affected return
#' @inheritSection DBItest::spec_meta_get_rows_affected Failure modes
#'
#' @inheritParams dbClearResult
#' @family DBIResult generics
#' @family command execution generics
#' @export
#' @examplesIf requireNamespace("RSQLite", quietly = TRUE)
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars)
#' rs <- dbSendStatement(con, "DELETE FROM mtcars")
#' dbGetRowsAffected(rs)
#' nrow(mtcars)
#'
#' dbClearResult(rs)
#' dbDisconnect(con)
setGeneric(
  "dbGetRowsAffected",
  def = function(res, ...) standardGeneric("dbGetRowsAffected"),
  valueClass = "numeric"
)

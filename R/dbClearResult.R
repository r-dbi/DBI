#' Clear a result set
#'
#' Frees all resources (local and remote) associated with a result set.
#' This step is mandatory for all objects obtained by calling
#' [dbSendQuery()] or [dbSendStatement()].
#'
#' @inheritSection dbBind The data retrieval flow
#' @inheritSection dbBind The command execution flow
#'
#' @template methods
#' @templateVar method_name dbClearResult
#'
#' @inherit DBItest::spec_result_clear_result return
#' @inheritSection DBItest::spec_result_clear_result Failure modes
#' @inheritSection DBItest::spec_result_clear_result Specification
#'
#' @param res An object inheriting from [DBI::DBIResult][DBIResult-class].
#' @param ... Other arguments passed on to methods.
#' @family DBIResult generics
#' @family DBIResultArrow generics
#' @family data retrieval generics
#' @family command execution generics
#' @export
#' @examplesIf requireNamespace("RSQLite", quietly = TRUE)
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' rs <- dbSendQuery(con, "SELECT 1")
#' print(dbFetch(rs))
#'
#' dbClearResult(rs)
#' dbDisconnect(con)
setGeneric("dbClearResult", def = function(res, ...) {
  standardGeneric("dbClearResult")
})

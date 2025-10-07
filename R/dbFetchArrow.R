#' Fetch records from a previously executed query as an Arrow object
#'
#' @description
#' `r lifecycle::badge('experimental')`
#'
#' Fetch the result set and return it as an Arrow object.
#' Use [dbFetchArrowChunk()] to fetch results in chunks.
#'
#' @inheritSection dbBind The data retrieval flow for Arrow streams
#'
#' @template methods
#' @templateVar method_name dbFetchArrow
#'
#' @inherit DBItest::spec_arrow_fetch_arrow return
#' @inheritSection DBItest::spec_arrow_fetch_arrow Failure modes
#' @inheritSection DBItest::spec_arrow_fetch_arrow Specification
#'
#' @param res An object inheriting from [DBI::DBIResultArrow][DBIResultArrow-class],
#'    created by [dbSendQueryArrow()].
#' @param ... Other arguments passed on to methods.
#' @seealso Close the result set with [dbClearResult()] as soon as you
#'   finish retrieving the records you want.
#' @family DBIResultArrow generics
#' @family data retrieval generics
#' @export
#' @examplesIf requireNamespace("RSQLite", quietly = TRUE) && requireNamespace("nanoarrow", quietly = TRUE)
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars)
#'
#' # Fetch all results
#' rs <- dbSendQueryArrow(con, "SELECT * FROM mtcars WHERE cyl = 4")
#' as.data.frame(dbFetchArrow(rs))
#' dbClearResult(rs)
#'
#' dbDisconnect(con)
setGeneric("dbFetchArrow", def = function(res, ...) {
  standardGeneric("dbFetchArrow")
})

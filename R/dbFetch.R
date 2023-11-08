#' Fetch records from a previously executed query
#'
#' Fetch the next `n` elements (rows) from the result set and return them
#' as a data.frame.
#'
#' `fetch()` is provided for compatibility with older DBI clients - for all
#' new code you are strongly encouraged to use `dbFetch()`. The default
#' implementation for `dbFetch()` calls `fetch()` so that it is compatible with
#' existing code. Modern backends should implement for `dbFetch()` only.
#'
#' @inheritSection dbBind The data retrieval flow
#'
#' @template methods
#' @templateVar method_name dbFetch
#'
#' @inherit DBItest::spec_result_fetch return
#' @inheritSection DBItest::spec_result_fetch Failure modes
#' @inheritSection DBItest::spec_result_fetch Specification
#' @inheritSection DBItest::spec_result_roundtrip Specification
#'
#' @param res An object inheriting from [DBIResult-class], created by
#'   [dbSendQuery()].
#' @param n maximum number of records to retrieve per fetch. Use `n = -1`
#'   or `n = Inf`
#'   to retrieve all pending records.  Some implementations may recognize other
#'   special values.
#' @param ... Other arguments passed on to methods.
#' @seealso Close the result set with [dbClearResult()] as soon as you
#'   finish retrieving the records you want.
#' @family DBIResult generics
#' @family data retrieval generics
#' @examplesIf requireNamespace("RSQLite", quietly = TRUE)
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars)
#'
#' # Fetch all results
#' rs <- dbSendQuery(con, "SELECT * FROM mtcars WHERE cyl = 4")
#' dbFetch(rs)
#' dbClearResult(rs)
#'
#' # Fetch in chunks
#' rs <- dbSendQuery(con, "SELECT * FROM mtcars")
#' while (!dbHasCompleted(rs)) {
#'   chunk <- dbFetch(rs, 10)
#'   print(nrow(chunk))
#' }
#'
#' dbClearResult(rs)
#' dbDisconnect(con)
#' @export
setGeneric("dbFetch",
  def = function(res, n = -1, ...) standardGeneric("dbFetch"),
  valueClass = "data.frame"
)

#' Clear a result set
#'
#' Frees all resources (local and remote) associated with a result set.  In some
#' cases (e.g., very large result sets) this can be a critical step to avoid
#' exhausting resources (memory, file descriptors, etc.)
#'
#' @template methods
#' @templateVar method_name dbClearResult
#'
#' @inherit DBItest::spec_result_clear_result return
#' @inheritSection DBItest::spec_result_clear_result Failure modes
#' @inheritSection DBItest::spec_result_clear_result Specification
#'
#' @param res An object inheriting from [DBIResult-class].
#' @param ... Other arguments passed on to methods.
#' @family DBIResult generics
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' rs <- dbSendQuery(con, "SELECT 1")
#' print(dbFetch(rs))
#'
#' dbClearResult(rs)
#' dbDisconnect(con)
setGeneric("dbClearResult",
  def = function(res, ...) standardGeneric("dbClearResult")
)

#' Completion status
#'
#' This method returns if the operation has completed.
#' A `SELECT` query is completed if all rows have been fetched.
#' A data manipulation statement is always completed.
#'
#' @template methods
#' @templateVar method_name dbHasCompleted
#'
#' @inherit DBItest::spec_meta_has_completed return
#' @inheritSection DBItest::spec_meta_has_completed Failure modes
#' @inheritSection DBItest::spec_meta_has_completed Specification
#'
#' @inheritParams dbClearResult
#' @family DBIResult generics
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars)
#' rs <- dbSendQuery(con, "SELECT * FROM mtcars")
#'
#' dbHasCompleted(rs)
#' ret1 <- dbFetch(rs, 10)
#' dbHasCompleted(rs)
#' ret2 <- dbFetch(rs)
#' dbHasCompleted(rs)
#'
#' dbClearResult(rs)
#' dbDisconnect(con)
setGeneric("dbHasCompleted",
  def = function(res, ...) standardGeneric("dbHasCompleted"),
  valueClass = "logical"
)

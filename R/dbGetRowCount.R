#' The number of rows fetched so far
#'
#' Returns the total number of rows actually fetched with calls to [dbFetch()]
#' for this result set.
#'
#' @template methods
#' @templateVar method_name dbGetRowCount
#'
#' @inherit DBItest::spec_meta_get_row_count return
#' @inheritSection DBItest::spec_meta_get_row_count Failure modes
#'
#' @inheritParams dbClearResult
#' @family DBIResult generics
#' @export
#' @examplesIf requireNamespace("RSQLite", quietly = TRUE)
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars)
#' rs <- dbSendQuery(con, "SELECT * FROM mtcars")
#'
#' dbGetRowCount(rs)
#' ret1 <- dbFetch(rs, 10)
#' dbGetRowCount(rs)
#' ret2 <- dbFetch(rs)
#' dbGetRowCount(rs)
#' nrow(ret1) + nrow(ret2)
#'
#' dbClearResult(rs)
#' dbDisconnect(con)
setGeneric(
  "dbGetRowCount",
  def = function(res, ...) standardGeneric("dbGetRowCount"),
  valueClass = "numeric"
)

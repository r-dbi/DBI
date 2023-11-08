#' Get the statement associated with a result set
#'
#' Returns the statement that was passed to [dbSendQuery()]
#' or [dbSendStatement()].
#'
#' @template methods
#' @templateVar method_name dbGetStatement
#'
#' @inherit DBItest::spec_meta_get_statement return
#' @inheritSection DBItest::spec_meta_get_statement Failure modes
#'
#' @inheritParams dbClearResult
#' @family DBIResult generics
#' @export
#' @examplesIf requireNamespace("RSQLite", quietly = TRUE)
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars)
#' rs <- dbSendQuery(con, "SELECT * FROM mtcars")
#' dbGetStatement(rs)
#'
#' dbClearResult(rs)
#' dbDisconnect(con)
setGeneric("dbGetStatement",
  def = function(res, ...) standardGeneric("dbGetStatement"),
  valueClass = "character"
)

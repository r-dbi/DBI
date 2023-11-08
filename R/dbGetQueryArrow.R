#' @export
#' @examplesIf requireNamespace("RSQLite", quietly = TRUE) && requireNamespace("nanoarrow", quietly = TRUE) && packageVersion("nanoarrow") >= "0.1.0.2"
#' # Retrieve data as arrow table
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars)
#' dbGetQueryArrow(con, "SELECT * FROM mtcars")
#'
#' dbDisconnect(con)
#' @rdname dbGetQuery
setGeneric("dbGetQueryArrow",
  def = function(conn, statement, ...) standardGeneric("dbGetQueryArrow")
)

#' @export
#' @examples
#' # Retrieve data as arrow table
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars)
#' dbGetStream(con, "SELECT * FROM mtcars")
#'
#' dbDisconnect(con)
#' @rdname dbGetQuery
setGeneric("dbGetStream",
  def = function(conn, statement, ...) standardGeneric("dbGetStream"),
  valueClass = "RecordBatchReader"
)

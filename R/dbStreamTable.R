#' @rdname dbReadTable
#' @export
#' @examples
#' # Read data as Arrow table
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars[1:10, ])
#' dbStreamTable(con, "mtcars")
#'
#' dbDisconnect(con)
setGeneric("dbStreamTable",
  def = function(conn, name, ...) {
    require_arrow()
    standardGeneric("dbStreamTable")
  },
  valueClass = "RecordBatchReader"
)

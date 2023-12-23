#' @rdname dbReadTable
#' @export
#' @examplesIf requireNamespace("RSQLite", quietly = TRUE) && requireNamespace("nanoarrow", quietly = TRUE)
#' # Read data as Arrow table
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars[1:10, ])
#' dbReadTableArrow(con, "mtcars")
#'
#' dbDisconnect(con)
setGeneric("dbReadTableArrow",
  def = function(conn, name, ...) {
    require_arrow()
    standardGeneric("dbReadTableArrow")
  }
)

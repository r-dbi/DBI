#' @rdname dbReadTable
#' @export
#' @examples
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
  },
  valueClass = "ArrowTabular"
)

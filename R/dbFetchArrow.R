#' @rdname dbFetch
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars)
#'
#' # Fetch all results as Arrow table
#' rs <- dbSendQuery(con, "SELECT * FROM mtcars WHERE cyl = 4")
#' dbFetchArrow(rs)
#' dbClearResult(rs)
#'
#' dbDisconnect(con)
#' @export
setGeneric("dbFetchArrow",
  def = function(res, n = -1, ...) {
    require_arrow()
    standardGeneric("dbFetchArrow")
  },
  valueClass = "ArrowTabular"
)

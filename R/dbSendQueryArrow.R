#' @rdname dbSendQuery
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars)
#' rs <- dbSendQueryArrow(con, "SELECT * FROM mtcars WHERE cyl = 4")
#' dbFetch(rs)
#' dbClearResult(rs)
#'
#' dbDisconnect(con)
#' @export
setGeneric("dbSendQueryArrow",
  def = function(conn, statement, ...) {
    require_arrow()
    standardGeneric("dbSendQueryArrow")
  },
  valueClass = "DBIResultArrow"
)

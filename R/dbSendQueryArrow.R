#' @rdname dbSendQuery
#' @examplesIf packageVersion("arrow") >= "9.0.0"
#' # Retrieve data as arrow table
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

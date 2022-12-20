#' @rdname dbSendQuery
#' @examples
#' # Retrieve data as arrow table
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars)
#' rs <- dbSendQueryStream(con, "SELECT * FROM mtcars WHERE cyl = 4")
#' dbFetch(rs)
#' dbClearResult(rs)
#'
#' dbDisconnect(con)
#' @export
setGeneric("dbSendQueryStream",
  def = function(conn, statement, ...) {
    require_arrow()
    standardGeneric("dbSendQueryStream")
  },
  valueClass = "DBIResultStream"
)

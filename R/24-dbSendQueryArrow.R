#' @rdname dbSendQuery
#' @examplesIf requireNamespace("RSQLite", quietly = TRUE) && requireNamespace("nanoarrow", quietly = TRUE) && packageVersion("nanoarrow") >= "0.1.0.2"
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

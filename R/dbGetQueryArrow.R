#' @export
#' @examples
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

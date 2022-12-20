#' @export
#' @examplesIf packageVersion("arrow") >= "9.0.0"
#' # Retrieve data as arrow table
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

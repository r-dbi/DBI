#' @examples
#' if (require("RSQLite")) {
#'   con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'   dbWriteTable(con, "iris", iris)
#'   iris_result <- dbGetQuery(con, "SELECT * FROM iris WHERE [Petal.Width] > 2.3")
#'   dbDisconnect(con)
#'   iris_result
#' }
"_PACKAGE"

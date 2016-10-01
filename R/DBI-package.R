#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "iris", iris)
#' dbGetQuery(con, "SELECT * FROM iris WHERE [Petal.Width] > 2.3")
#'
#' dbDisconnect(con)
#' @seealso
#'   Important generics: [dbConnect()], [dbGetQuery()],
#'   [dbWriteTable()], [dbDisconnect()]
#'
#'   Formal specification (currently work in progress and incomplete):
#'   \link{DBIspec}
"_PACKAGE"

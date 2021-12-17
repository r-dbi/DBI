#' @include hidden.R
#' @include DBConnection.R
#' @include DBDriver.R
setClass("AnsiConnection", contains = "DBIConnection")

#' A dummy DBI connector that simulates ANSI-SQL compliance
#'
#' @export
#' @keywords internal
#' @examples
#' ANSI()
ANSI <- function() {
  new("AnsiConnection")
}

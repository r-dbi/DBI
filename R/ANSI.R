#' @include hidden.R
#' @include DBIConnection.R
#' @include DBIDriver.R
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

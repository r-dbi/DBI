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

#' @export
#' @rdname ANSI
setMethod("show", "AnsiConnection", function(object) {
  cat("<AnsiConnection>\n")
})

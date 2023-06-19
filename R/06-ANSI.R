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

#' Internal page for hidden aliases
#'
#' For S4 methods that require a documentation entry but only clutter the index.
#'
#' @usage NULL
#' @format NULL
#' @keywords internal
#' @docType methods
hidden_aliases <- NULL

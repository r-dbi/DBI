#' Determine the current version of the package.
#' 
#' @export
#' @keywords internal
dbGetDBIVersion <- function() {
  packageVersion("DBI")
}

#' Print a list of pairs.
#' 
#' @param x a list of key, value pairs
#' @param ... additional arguments to be passed to \code{cat}
#' @return the (invisible) value of x.
#' @keywords internal
#' @export
#' @examples
#' print.list.pairs(list(a = 1, b = 2))
print.list.pairs <- function(x, ...) {
  for(key in names(x)){
    value <- format(x[[key]])
    if(value=="") next
    cat(key, "=", value, "\n")
  }
  invisible(x)
}

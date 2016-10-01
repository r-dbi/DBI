#' Print a list of pairs.
#'
#' DEPRECATED, do not use. Use [base::summary()] to print output of
#' [dbGetInfo()].
#'
#' @param x a list of key, value pairs
#' @param ... additional arguments to be passed to `cat`
#' @return the (invisible) value of x.
#' @keywords internal
#' @export print.list.pairs
print.list.pairs <- function(x, ...) {
  .Deprecated()
  print_list_pairs(x, ...)
}

print_list_pairs <- function(x, ...) {
  for(key in names(x)){
    value <- format(x[[key]])
    if (identical(value, "")) next
    cat(key, "=", value, "\n")
  }
  invisible(x)
}

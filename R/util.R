#' @export
dbGetDBIVersion <- function() {
  packageVersion("DBI")
}

#' @export
print.list.pairs <- function(x, ...) {
  for(key in names(x)){
    value <- format(x[[key]])
    if(value=="") next
    cat(key, "=", value, "\n")
  }
  invisible(x)
}

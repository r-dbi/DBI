## Utilities.  These actually have been implemented by the DBI,
## but individual driver could overload them;  for instance, the
## set of SQL keywords should be extended by the various packages.
##

dbGetDBIVersion <- function() {
  packageVersion("DBI")
}

print.list.pairs <- function(x, ...) {
  for(key in names(x)){
    value <- format(x[[key]])
    if(value=="") next
    cat(key, "=", value, "\n")
  }
  invisible(x)
}

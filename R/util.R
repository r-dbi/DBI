# Give a deprecation error, warning, or messsage, depending on version number.
dbi_dep <- function(version, msg) {
  v <- as.package_version(version)
  cv <- packageVersion("DBI")

  # If current major number is greater than last-good major number, or if
  #  current minor number is more than 1 greater than last-good minor number,
  #  give error.
  if (cv[[1,1]] > v[[1,1]]  ||  cv[[1,2]] > v[[1,2]] + 1) {
    stop(msg, " (Defunct; last used in version ", version, ")",
      call. = FALSE)
  }
  # If minor number differs by one, give warning
  if (cv[[1,2]] > v[[1,2]]) {
    warning(msg, " (Deprecated; last used in version ", version, ")",
      call. = FALSE)
    return(invisible())
  }

  # If only subminor number is greater, give message
  if (cv[[1,3]] > v[[1,3]]) {
    message(msg, " (Deprecated; last used in version ", version, ")")
  }

  invisible()
}

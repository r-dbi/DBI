#' @usage NULL
summary_DBIObject <- function(object, ...) {
  info <- dbGetInfo(dbObj = object, ...)
  cat(class(object), "\n")
  print_list_pairs(info)
  invisible(info)
}

setMethod("summary", "DBIObject", summary_DBIObject)

print_list_pairs <- function(x, ...) {
  for (key in names(x)) {
    value <- format(x[[key]])
    if (identical(value, "")) next
    cat(key, "=", value, "\n")
  }
  invisible(x)
}

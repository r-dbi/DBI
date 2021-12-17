#' @usage NULL
summary_DBIObject <- function(object, ...) {
  info <- dbGetInfo(dbObj = object, ...)
  cat(class(object), "\n")
  print_list_pairs(info)
  invisible(info)
}

setMethod("summary", "DBIObject", summary_DBIObject)

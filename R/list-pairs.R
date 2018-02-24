print_list_pairs <- function(x, ...) {
  for(key in names(x)){
    value <- format(x[[key]])
    if (identical(value, "")) next
    cat(key, "=", value, "\n")
  }
  invisible(x)
}

#' @rdname hidden_aliases
#' @usage NULL
dbFetchArrow_DBIResultArrow <- function(res, ...) {
  chunk <- dbFetchArrowChunk_DBIResultArrow(res)
  out <- list(chunk)
  # Corner case: add empty chunk only for zero rows, for schema
  if (chunk$length == 0) {
    return(nanoarrow::basic_array_stream(out, validate = FALSE))
  }

  repeat {
    chunk <- dbFetchArrowChunk_DBIResultArrow(res)
    if (chunk$length == 0) {
      return(nanoarrow::basic_array_stream(out, validate = FALSE))
    }
    out <- c(out, list(chunk))
  }
}

#' @rdname hidden_aliases
#' @export
setMethod("dbFetchArrow", signature("DBIResultArrow"), dbFetchArrow_DBIResultArrow)

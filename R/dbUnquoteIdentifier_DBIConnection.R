#' @rdname hidden_aliases
#' @usage NULL
dbUnquoteIdentifier_DBIConnection <- function(conn, x, ...) {
  if (is(x, "SQL") || is.character(x)) {
    if (is.character(x)) {
      stopifnot(!anyNA(x))
    }
    # Determine quoting character
    quote_char <- substr(dbQuoteIdentifier(conn, ""), 1L, 1L)
    x <- lapply(x, unquote, quote_char = quote_char)
    lapply(x, Id)
  } else if (is(x, "Id")) {
    list(x)
  } else {
    stop("x must be SQL, Id, or character", call. = FALSE)
  }
}

unquote <- function(x, quote_char) {
  # replace doubled quotes with escaped quote
  gsub <- gsub(
    pattern = paste0(quote_char, quote_char),
    replacement = paste0("\\", quote_char),
    x
  )

  scan(
    text = x,
    what = character(),
    quote = quote_char,
    quiet = TRUE,
    na.strings = character(),
    sep = "."
  )
}

#' @rdname hidden_aliases
#' @export
setMethod(
  "dbUnquoteIdentifier",
  signature("DBIConnection"),
  dbUnquoteIdentifier_DBIConnection
)

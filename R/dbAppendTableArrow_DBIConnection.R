#' @rdname hidden_aliases
#' @usage NULL
dbAppendTableArrow_DBIConnection <- function(conn, name, value, ...) {
  require_arrow()

  name <- dbQuoteIdentifier(conn, name)

  value <- nanoarrow::as_nanoarrow_array_stream(value)

  while (TRUE) {
    # Append next batch (starting with the first or second, doesn't matter)
    tmp <- value$get_next()
    if (is.null(tmp)) {
      break
    }
    dbAppendTable(conn, name, stream_append_data(as.data.frame(tmp)), ...)
  }

  value$release()

  TRUE
}
#' @rdname hidden_aliases
#' @export
setMethod("dbAppendTableArrow", signature("DBIConnection"), dbAppendTableArrow_DBIConnection)

stream_append_data <- function(value) {
  value <- factor_to_string(value)
  value <- string_to_utf8(value)
  value
}

factor_to_string <- function(value, warn = FALSE) {
  is_factor <- vapply(value, is.factor, logical(1))
  if (warn && any(is_factor)) {
    warning("Factors converted to character", call. = FALSE)
  }
  value[is_factor] <- lapply(value[is_factor], as.character)
  value
}

raw_to_string <- function(value) {
  is_raw <- vapply(value, is.raw, logical(1))

  if (any(is_raw)) {
    warning("Creating a TEXT column from raw, use lists of raw to create BLOB columns", call. = FALSE)
    value[is_raw] <- lapply(value[is_raw], as.character)
  }

  value
}

quote_string <- function(value, conn) {
  is_character <- vapply(value, is.character, logical(1))
  value[is_character] <- lapply(value[is_character], dbQuoteString, conn = conn)
  value
}

string_to_utf8 <- function(value) {
  is_char <- vapply(value, is.character, logical(1))
  value[is_char] <- lapply(value[is_char], enc2utf8)
  value
}

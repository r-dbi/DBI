#' @rdname hidden_aliases
#' @usage NULL
dbQuoteString_DBIConnection <- function(conn, x, ...) {
  if (is(x, "SQL")) return(x)
  if (!is.character(x)) stop("x must be character or SQL", call. = FALSE)

  # Avoid fixed = TRUE due to https://github.com/r-dbi/DBItest/issues/156
  x <- gsub("'", "''", enc2utf8(x))

  if (length(x) == 0L) {
    SQL(character())
  } else {
    # Not calling encodeString() here, see also https://stackoverflow.com/a/549244/946850
    # and especially the comment by Álvaro González
    str <- paste("'", x, "'", sep = "")
    str[is.na(x)] <- "NULL"
    SQL(str)
  }
}

# Need to keep other method declarations around for now, because clients might
# use getMethod(), see e.g. https://github.com/r-dbi/odbc/pull/149
#' @rdname hidden_aliases
#' @export
setMethod("dbQuoteString", signature("DBIConnection"), dbQuoteString_DBIConnection)

#' @rdname hidden_aliases
#' @export
setMethod("dbQuoteString", signature("DBIConnection", "character"), dbQuoteString_DBIConnection)

#' @rdname hidden_aliases
#' @export
setMethod("dbQuoteString", signature("DBIConnection", "SQL"), dbQuoteString_DBIConnection)

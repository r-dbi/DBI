#' @rdname hidden_aliases
#' @usage NULL
dbQuoteIdentifier_DBIConnection <- function(conn, x, ...) {
  # Don't support lists, auto-vectorization violates type stability
  if (is(x, "SQL")) return(x)
  if (is(x, "Id")) {
    return(SQL(paste0(dbQuoteIdentifier(conn, x@name), collapse = ".")))
  }
  if (!is.character(x)) stop("x must be character or SQL", call. = FALSE)

  if (any(is.na(x))) {
    stop("Cannot pass NA to dbQuoteIdentifier()", call. = FALSE)
  }
  # Avoid fixed = TRUE due to https://github.com/r-dbi/DBItest/issues/156
  x <- gsub('"', '""', enc2utf8(x))
  if (length(x) == 0L) {
    SQL(character(), names = names(x))
  } else {
    # Not calling encodeString() here to keep things simple
    SQL(paste('"', x, '"', sep = ""), names = names(x))
  }
}

#' @rdname hidden_aliases
#' @export
setMethod("dbQuoteIdentifier", signature("DBIConnection"), dbQuoteIdentifier_DBIConnection)

# Need to keep other method declarations around for now, because clients might
# use getMethod(), see e.g. https://github.com/r-dbi/odbc/pull/149
#' @rdname hidden_aliases
#' @export
setMethod("dbQuoteIdentifier", signature("DBIConnection", "character"), dbQuoteIdentifier_DBIConnection)

#' @rdname hidden_aliases
#' @export
setMethod("dbQuoteIdentifier", signature("DBIConnection", "SQL"), dbQuoteIdentifier_DBIConnection)

#' @rdname hidden_aliases
#' @export
setMethod("dbQuoteIdentifier", signature("DBIConnection", "Id"), dbQuoteIdentifier_DBIConnection)

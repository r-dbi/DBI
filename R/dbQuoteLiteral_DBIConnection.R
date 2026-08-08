#' @rdname hidden_aliases
#' @usage NULL
dbQuoteLiteral_DBIConnection <- function(conn, x, ...) {
  # Switchpatching to avoid ambiguous S4 dispatch, so that our method
  # is used only if no alternatives are available.

  if (is(x, "SQL")) {
    return(x)
  }

  if (is.factor(x)) {
    return(dbQuoteString(conn, as.character(x)))
  }

  if (is.character(x)) {
    return(dbQuoteString(conn, x))
  }

  if (inherits(x, "POSIXt")) {
    return(dbQuoteString(
      conn,
      strftime(as.POSIXct(x), "%Y-%m-%d %H:%M:%S%z")
    ))
  }

  if (inherits(x, "Date")) {
    return(dbQuoteString(conn, as.character(x)))
  }

  if (inherits(x, "difftime")) {
    return(dbQuoteString(conn, format_hms(x)))
  }

  if (is.list(x)) {
    blob_data <- vapply(
      x,
      function(x) {
        if (is.null(x)) {
          "NULL"
        } else if (is.raw(x)) {
          paste0("X'", paste(format(x), collapse = ""), "'")
        } else {
          stop("Lists must contain raw vectors or NULL", call. = FALSE)
        }
      },
      character(1)
    )
    return(SQL(blob_data, names = names(x)))
  }

  if (is.double(x)) {
    out <- as.character(x)
    # Fall back to a longer decimal representation only when the default
    # formatting does not round-trip to the original double value.
    needs_precise <- is.finite(x) & (as.numeric(out) != x)
    if (any(needs_precise)) {
      out[needs_precise] <- formatC(
        x[needs_precise],
        digits = 17,
        format = "fg",
        flag = "#"
      )
    }
    out[is.na(out)] <- "NULL"
    return(SQL(out, names = names(x)))
  }

  if (is.logical(x)) {
    x <- as.numeric(x)
  }

  x <- as.character(x)
  x[is.na(x)] <- "NULL"
  SQL(x, names = names(x))
}
#' @rdname hidden_aliases
#' @export
setMethod(
  "dbQuoteLiteral",
  signature("DBIConnection"),
  dbQuoteLiteral_DBIConnection
)

#' @rdname hidden_aliases
#' @usage NULL
dbQuoteLiteral_DBIConnection <- function(conn, x, ...) {
  # Switchpatching to avoid ambiguous S4 dispatch,
  # so that our method is used only if no alternatives are available.

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

  # Classed doubles such as integer64 keep the as.character() path below,
  # because their bits do not hold the value that sprintf() would read.
  if (is.double(x) && !is.object(x)) {
    out <- as.character(x)
    # Use a more precise representation only when the default formatting
    # loses information.
    # Take the shortest of 15, 16, or 17 significant digits that round-trips;
    # the general format avoids huge fixed-point edge values.
    needs_precise <- is.finite(x) & (as.numeric(out) != x)
    for (digits in 15:17) {
      if (!any(needs_precise)) {
        break
      }
      precise <- sprintf(paste0("%.", digits, "g"), x[needs_precise])
      ok <- digits == 17 | as.numeric(precise) == x[needs_precise]
      out[needs_precise][ok] <- precise[ok]
      needs_precise[needs_precise] <- !ok
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

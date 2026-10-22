#' @rdname hidden_aliases
#' @usage NULL
dbGetQueryArrow_DBIConnection_character <- function(conn, statement, ...) {
  rs <- dbSendQueryArrow(conn, statement, ...)

  # With the default fetch method, the result is owned by the returned stream,
  # which clears it once the stream reaches the end or is released.
  if (uses_default_fetch_arrow(rs)) {
    owned <- FALSE
    on.exit(if (!owned) dbClearResult(rs))
    stream <- fetch_arrow_stream(rs, owned = TRUE)
    owned <- TRUE
    return(stream)
  }

  on.exit(dbClearResult(rs))

  dbFetchArrow(rs, ...)
}
#' @rdname hidden_aliases
#' @export
setMethod(
  "dbGetQueryArrow",
  signature("DBIConnection"),
  dbGetQueryArrow_DBIConnection_character
)

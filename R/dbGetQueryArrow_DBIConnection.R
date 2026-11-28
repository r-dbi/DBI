#' @rdname hidden_aliases
#' @usage NULL
dbGetQueryArrow_DBIConnection_character <- function(conn, statement, ...) {
  rs <- dbSendQueryArrow(conn, statement, ...)
  on.exit(dbClearResult(rs))

  dbFetchArrow(rs, ...)
}

# Like the default method.
# With `lazy = TRUE`, if the result uses the default dbFetchArrow() method
# and has_lazy_arrow() is `TRUE`,
# the result is owned by the returned stream,
# which fetches the remaining chunks lazily
# and clears the result once the stream reaches the end or is released.
# Lazy fetching is internal for now and not used by the default methods.
get_query_arrow <- function(conn, statement, ..., lazy = FALSE) {
  if (!lazy || !has_lazy_arrow()) {
    return(dbGetQueryArrow_DBIConnection_character(conn, statement, ...))
  }

  rs <- dbSendQueryArrow(conn, statement, ...)

  if (uses_default_fetch_arrow(rs)) {
    owned <- FALSE
    on.exit(if (!owned) dbClearResult(rs))
    stream <- fetch_arrow_stream(rs, owned = TRUE, lazy = TRUE)
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

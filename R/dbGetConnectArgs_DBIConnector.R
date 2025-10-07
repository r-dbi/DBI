#' @rdname hidden_aliases
#' @usage NULL
dbGetConnectArgs_DBIConnector <- function(drv, eval = TRUE, ...) {
  conn_args <- drv@.conn_args
  if (isTRUE(eval)) {
    conn_args <- lapply(conn_args, function(x) {
      if (is.function(x)) x() else x
    })
  }
  conn_args
}
#' @rdname hidden_aliases
#' @export
setMethod(
  "dbGetConnectArgs",
  signature("DBIConnector"),
  dbGetConnectArgs_DBIConnector
)

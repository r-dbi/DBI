#' Disconnect (close) a connection
#'
#' This closes the connection, discards all pending work, and frees
#' resources (e.g., memory, sockets).
#'
#' @template methods
#' @templateVar method_name dbDisconnect
#'
#' @inherit DBItest::spec_connection_disconnect return
#' @inheritSection DBItest::spec_connection_disconnect Failure modes
#'
#' @section Connection lifetime in packages:
#' For package-level connection reuse, consider delegating connection lifetime
#' management to the pool package. If a package manages a long-lived connection
#' itself, any finalizer that calls `dbDisconnect()` should keep the connection
#' object reachable until the finalizer runs, and should check [dbIsValid()]
#' before disconnecting.
#'
#' @inheritParams dbGetQuery
#' @family DBIConnection generics
#' @export
#' @examplesIf requireNamespace("RSQLite", quietly = TRUE)
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#' dbDisconnect(con)
setGeneric("dbDisconnect", def = function(conn, ...) {
  otel_local_active_span("dbDisconnect", conn)
  standardGeneric("dbDisconnect")
})

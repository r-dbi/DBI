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

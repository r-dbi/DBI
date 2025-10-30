otel_tracer_name <- "org.r-dbi.DBI"
otel_tracer <- NULL
otel_is_tracing <- FALSE

otel_local_active_span <- function(
    name,
    conn,
    append = NULL,
    attributes = NULL,
    activation_scope = parent.frame()
) {
  otel_is_tracing || return()
  dbname <- get_dbname(conn)
  otel::start_local_active_span(
    name = sprintf("%s %s", name, if (length(append)) append else dbname),
    attributes = otel::as_attributes(c(attributes, list(db.system.name = dbname))),
    options = list(kind = "client"),
    tracer = otel_tracer,
    activation_scope = activation_scope
  )
}

cache_otel_tracer <- function() {
  requireNamespace("otel", quietly = TRUE) || return()
  otel_tracer <<- otel::get_tracer(otel_tracer_name)
  otel_is_tracing <<- tracer_enabled(otel_tracer)
}

tracer_enabled <- function(tracer) {
  .subset2(tracer, "is_enabled")()
}

otel_refresh_tracer <- function(pkgname) {
  requireNamespace("otel", quietly = TRUE) || return()
  ns <- getNamespace(pkgname)
  do.call(unlockBinding, list("otel_is_tracing", ns)) # do.call for R CMD Check
  do.call(unlockBinding, list("otel_tracer", ns))
  otel_tracer <- otel::get_tracer()
  ns[["otel_is_tracing"]] <- tracer_enabled(otel_tracer)
  ns[["otel_tracer"]] <- otel_tracer
  lockBinding("otel_is_tracing", ns)
  lockBinding("otel_tracer", ns)
}

# DBI-specific helpers:

get_dbname <- function(conn) {
  dbname <- attr(class(conn), "package")
  is.null(dbname) && return("unknown")
  dbname
}

make_query_attributes <- function(statement, ...) {
  query <- strsplit(statement, " ", fixed = TRUE)[[1L]]
  operation <- query[[1L]]
  collection <- query[which(query == "FROM") + 1L]
  if (!length(collection)) collection <- ""
  # Otel semantic conventions for DB mandates that parameterized queries
  # should not be sanitized for sensitive information.
  # https://opentelemetry.io/docs/specs/semconv/database/database-spans/#sanitization-of-dbquerytext
  text <- if (any(...names() == "params")) statement else "<redacted>"
  list(
    db.operation.name = operation,
    db.collection.name = collection,
    db.query.text = text
  )
}

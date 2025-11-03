otel_tracer_name <- "org.r-dbi.DBI"
otel_tracer <- NULL
otel_is_tracing <- FALSE

otel_local_active_span <- function(
    name,
    conn,
    label = NULL,
    attributes = NULL,
    activation_scope = parent.frame()
) {
  otel_is_tracing || return()
  dbname <- get_dbname(conn)
  otel::start_local_active_span(
    name = sprintf("%s %s", name, if (length(label)) label else dbname),
    attributes = otel::as_attributes(c(attributes, list(db.system.name = dbname))),
    options = list(kind = "client"),
    tracer = otel_tracer,
    activation_scope = activation_scope
  )
}

otel_cache_tracer <- function() {
  requireNamespace("otel", quietly = TRUE) || return()
  otel_tracer <<- otel::get_tracer(otel_tracer_name)
  otel_is_tracing <<- tracer_enabled(otel_tracer)
}

tracer_enabled <- function(tracer) {
  .subset2(tracer, "is_enabled")()
}

otel_refresh_tracer <- function(pkgname) {
  requireNamespace("otel", quietly = TRUE) || return()
  tracer <- otel::get_tracer()
  modify_binding(
    getNamespace(pkgname),
    c("otel_tracer", "otel_is_tracing"),
    list(tracer, tracer_enabled(tracer))
  )
}

modify_binding <- function(env, name, object) {
  lapply(name, unlockBinding, env)
  list2env(`names<-`(object, name), envir = env)
  lapply(name, lockBinding, env)
}

# DBI-specific helpers:

get_dbname <- function(conn) {
  dbname <- attr(class(conn), "package")
  if (is.null(dbname)) "unknown" else dbname
}

collection_name <- function(name, conn) {
  if (is.character(name)) name else dbQuoteIdentifier(conn, x = name)
}

make_query_attributes <- function(statement) {
  query <- strsplit(statement, " ", fixed = TRUE)[[1L]]
  list(
    db.operation.name = query[[1L]],
    db.collection.name = query[[which(query == "FROM") + 1L]]
  )
}

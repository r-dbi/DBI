otel_tracer_name <- "org.r-dbi.DBI"

# Generic otel helpers:

otel_cache_tracer <- function() {
  requireNamespace("otel", quietly = TRUE) || return()
  tracer <- otel::get_tracer(otel_tracer_name)
  list2env(
    list(otel_tracer = tracer, otel_is_tracing = tracer_enabled(tracer)),
    envir = environment(otel_local_active_span)
  )
}

tracer_enabled <- function(tracer) {
  .subset2(tracer, "is_enabled")()
}

otel_local_active_span <- local({
  otel_tracer <- NULL
  otel_is_tracing <- FALSE

  function(
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
})

with_otel_record <- function(expr) {
  on.exit(otel_cache_tracer())
  otelsdk::with_otel_record({
    otel_cache_tracer()
    expr
  })
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
    db.operation.name = query[1L],
    db.collection.name = query[which(query == "FROM") + 1L]
  )
}

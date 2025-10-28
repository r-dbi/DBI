otel_tracer_name <- "org.r-dbi.DBI"
otel_tracer <- NULL
otel_is_tracing <- FALSE

otel_local_active_span <- function(
    name,
    con,
    append = NULL,
    attributes = NULL,
    statement = NULL,
    tracer = otel_tracer,
    activation_scope = parent.frame()
) {
  otel_is_tracing || return()
  dbname <- attr(class(con), "package")
  if (is.null(dbname)) dbname <- "unknown"
  if (is.character(statement)) {
    query <- strsplit(statement, " ", fixed = TRUE)[[1L]]
    name <- query[1L]
    append <- query[which(query == "FROM") + 1L]
    attributes <- c(
      attributes,
      list(
        db.operation.name = name,
        db.collection.name = append
      )
    )
  }
  otel::start_local_active_span(
    name = sprintf("%s %s", name, if (length(append)) append else dbname),
    attributes = otel::as_attributes(c(attributes, list(db.system.name = dbname))),
    options = list(kind = "client"),
    tracer = tracer,
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

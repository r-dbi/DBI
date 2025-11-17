otel_tracer_name <- "org.r-dbi.DBI"

# Generic otel helpers:

otel_cache_tracer <- NULL
otel_local_active_span <- NULL

local({
  otel_tracer <- NULL
  otel_is_tracing <- FALSE

  otel_cache_tracer <<- function() {
    requireNamespace("otel", quietly = TRUE) || return()
    otel_tracer <<- otel::get_tracer(otel_tracer_name)
    otel_is_tracing <<- tracer_enabled(otel_tracer)
  }

  otel_local_active_span <<- function(
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
      attributes = c(attributes, list(db.system.name = dbname)),
      options = list(kind = "client"),
      tracer = otel_tracer,
      activation_scope = activation_scope
    )
  }
})

tracer_enabled <- function(tracer) {
  .subset2(tracer, "is_enabled")()
}

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

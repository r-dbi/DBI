otel_tracer_name <- "org.r-dbi.DBI"

# Generic otel helpers:

otel_cache_tracer <- NULL
otel_local_active_span <- NULL
otel_query_local_active_span <- NULL

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

  otel_query_local_active_span <<- function(
    conn,
    statement,
    activation_scope = parent.frame()
  ) {
    otel_is_tracing || return()
    dbname <- get_dbname(conn)
    tokens <- strsplit(statement, " ", fixed = TRUE)[[1L]]
    op_name <- tokens[1L]
    from_idx <- match("FROM", toupper(tokens))
    collection <- if (!is.na(from_idx)) tokens[from_idx + 1L] else character()
    otel::start_local_active_span(
      name = paste(op_name, if (length(collection)) collection else dbname),
      attributes = list(
        db.operation.name = op_name,
        db.collection.name = collection,
        db.system.name = dbname
      ),
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

get_dbname <- function(obj) {
  dbname <- attr(class(obj), "package")
  if (is.null(dbname)) "unknown" else dbname
}

collection_name <- function(name, conn) {
  if (is.character(name)) name else dbQuoteIdentifier(conn, x = name)
}

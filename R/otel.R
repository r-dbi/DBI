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
    dbname <- .dbi_get_db_name(conn)
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
    dbname <- .dbi_get_db_name(conn)

    collection <- character()
    op_name <- "SQL"

    if (length(statement) == 1) {
      op_name_matcher <- "^\\s*(\\w+)"
      op_name_matches <- regexec(
        op_name_matcher,
        statement,
        ignore.case = TRUE
      )
      op_name_match <- regmatches(statement, op_name_matches)[[1L]]
      op_name <- toupper(op_name_match[2L])

      collection_matcher <- "(FROM)\\s+([`\"']?)(\\w+)\\2"
      # collection_matcher <- "(FROM|INTO|UPDATE|TABLE)\\s+([`\"']?)(\\w+)\\2"
      collection_matches <- gregexec(
        collection_matcher,
        statement,
        ignore.case = TRUE,
        perl = TRUE
      )
      collection_match <- regmatches(statement, collection_matches)[[1L]]

      # Returns an empty character vector if there is no match
      if (is.matrix(collection_match) && nrow(collection_match) >= 4L) {
        collection <- collection_match[4L, , drop = TRUE]
      }
    }

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

# When this was called `get_dbname()`, it collided with `dittodb::get_dbname()`
# for some weakly understood reason.
# The weird name makes collisions more unlikely.
.dbi_get_db_name <- function(obj) {
  dbname <- attr(class(obj), "package")
  if (is.null(dbname)) "unknown" else dbname
}

.dbi_get_collection_name <- function(name, conn) {
  if (is.character(name)) name else dbQuoteIdentifier(conn, x = name)
}

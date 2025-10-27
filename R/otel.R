#' @importFrom otel
#'   as_attributes
#'   get_active_span
#'   start_local_active_span
NULL

otel_tracer_name <- "org.r-dbi.DBI"

otel_local_active_span <- function(
    name,
    con,
    append = NULL,
    attributes = NULL,
    statement = NULL,
    tracer = get_tracer(),
    activation_scope = parent.frame()
) {
  tracer_enabled(tracer) || return()
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
  start_local_active_span(
    name = sprintf("%s %s", name, if (length(append)) append else dbname),
    attributes = as_attributes(c(attributes, list(db.system.name = dbname))),
    options = list(kind = "client"),
    tracer = tracer,
    activation_scope = activation_scope
  )
}

tracer_enabled <- function(tracer) {
  .subset2(tracer, "is_enabled")()
}

get_tracer <- local({
  tracer <- NULL
  function() {
    if (!is.null(tracer)) {
      return(tracer)
    }
    new_tracer <- otel::get_tracer()
    # Don't cache the tracer in unit tests. It interferes with tracer provider
    # injection in otelsdk::with_otel_record().
    if (!testthat__is_testing()) {
      tracer <<- new_tracer
    }
    new_tracer
  }
})

# testthat::is_testing()
testthat__is_testing <- function() {
  identical(Sys.getenv("TESTTHAT"), "true")
}

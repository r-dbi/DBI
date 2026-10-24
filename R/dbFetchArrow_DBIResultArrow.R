#' @rdname hidden_aliases
#' @usage NULL
dbFetchArrow_DBIResultArrow <- function(res, ...) {
  fetch_arrow_stream(res, lazy = use_lazy_arrow())
}

# Returns the remaining rows of `res` as a nanoarrow array stream.
# The first chunk is fetched eagerly to determine the schema.
# If more rows remain and `lazy` is `TRUE`,
# the remaining chunks are fetched only when the stream is consumed.
# With `owned = TRUE`, the result is cleared once it is no longer needed:
# right away if all rows have been fetched,
# otherwise when the stream reaches the end or is released.
fetch_arrow_stream <- function(res, owned = FALSE, lazy) {
  # Decide before fetching, so that an invalid option leaves the result untouched
  force(lazy)

  chunk <- dbFetchArrowChunk_DBIResultArrow(res)
  schema <- nanoarrow::infer_nanoarrow_schema(chunk)

  # Corner case: add empty chunk only for zero rows, for schema
  if (chunk$length == 0) {
    if (owned) {
      dbClearResult(res)
    }
    return(nanoarrow::basic_array_stream(
      list(),
      schema = schema,
      validate = FALSE
    ))
  }

  if (lazy && !dbHasCompleted(res)) {
    return(fetch_arrow_stream_lazy(res, chunk, schema, owned))
  }

  out <- list(chunk)
  repeat {
    chunk <- dbFetchArrowChunk_DBIResultArrow(res)
    if (chunk$length == 0) {
      if (owned) {
        dbClearResult(res)
      }
      return(nanoarrow::basic_array_stream(
        out,
        schema = schema,
        validate = FALSE
      ))
    }
    out <- c(out, list(chunk))
  }
}

fetch_arrow_stream_lazy <- function(res, chunk, schema, owned) {
  # The callbacks must not capture the stream itself:
  # nanoarrow keeps them alive until the stream is released,
  # so a reference to the stream would prevent its finalization.
  callbacks <- fetch_arrow_callbacks(res, chunk, owned)

  stream <- nanoarrow::function_array_stream(
    callbacks$next_chunk,
    schema = schema,
    validate = FALSE
  )

  if (owned) {
    stream <- nanoarrow::array_stream_set_finalizer(stream, callbacks$clear)
  }

  stream
}

fetch_arrow_callbacks <- function(res, chunk, owned) {
  # Unevaluated promises would keep the caller's frame, and the stream, alive.
  force(res)
  force(chunk)
  force(owned)

  clear <- function() {
    if (owned && dbIsValid(res)) {
      dbClearResult(res)
    }
  }

  next_chunk <- function() {
    if (!is.null(chunk)) {
      out <- chunk
      chunk <<- NULL
      return(out)
    }

    # nanoarrow does not call this function again after an error,
    # so an owned result is cleared before the error propagates.
    out <- withCallingHandlers(
      dbFetchArrowChunk_DBIResultArrow(res),
      error = function(e) try(clear(), silent = TRUE),
      interrupt = function(e) try(clear(), silent = TRUE)
    )
    if (out$length == 0) {
      clear()
      return(NULL)
    }
    out
  }

  list(next_chunk = next_chunk, clear = clear)
}

uses_default_fetch_arrow <- function(res) {
  method <- selectMethod("dbFetchArrow", class(res))
  identical(method@.Data, dbFetchArrow_DBIResultArrow)
}

# Lazy fetching is enabled by default and can be disabled
# with `options(DBI.lazy_arrow = FALSE)`.
# It requires a nanoarrow version that provides function_array_stream().
# The option is read once per operation,
# so that a stream keeps the behavior it was created with.
use_lazy_arrow <- function() {
  lazy <- getOption("DBI.lazy_arrow", TRUE)
  if (!is.logical(lazy) || length(lazy) != 1 || is.na(lazy)) {
    stop(
      "The `DBI.lazy_arrow` option must be `TRUE` or `FALSE`.",
      call. = FALSE
    )
  }
  lazy && has_function_array_stream()
}

has_function_array_stream <- function() {
  "function_array_stream" %in% getNamespaceExports("nanoarrow")
}

#' @rdname hidden_aliases
#' @export
setMethod(
  "dbFetchArrow",
  signature("DBIResultArrow"),
  dbFetchArrow_DBIResultArrow
)

#' @rdname hidden_aliases
#' @usage NULL
dbFetchArrow_DBIResultArrow <- function(res, ...) {
  fetch_arrow_stream(res)
}

# Returns the remaining rows of `res` as a nanoarrow array stream.
# The first chunk is fetched eagerly to determine the schema.
# If more rows remain, `lazy` is `TRUE`, and has_lazy_arrow() is `TRUE`,
# the remaining chunks are fetched only when the stream is consumed.
# Otherwise, all chunks are fetched right away.
# Lazy fetching is internal for now and not used by the default methods.
# With `owned = TRUE`, the result is cleared once it is no longer needed:
# right away if all rows have been fetched,
# otherwise when the stream reaches the end or is released.
fetch_arrow_stream <- function(res, owned = FALSE, lazy = FALSE) {
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

  if (lazy && !dbHasCompleted(res) && has_lazy_arrow()) {
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

  stream <- nanoarrow_function_array_stream(
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

# Lazy fetching requires nanoarrow::function_array_stream(),
# which is not available in nanoarrow 0.9.0 and earlier.
# The capability is checked once per session.
lazy_arrow_cache <- new.env(parent = emptyenv())

has_lazy_arrow <- function() {
  if (is.null(lazy_arrow_cache$has_lazy_arrow)) {
    lazy_arrow_cache$has_lazy_arrow <- check_lazy_arrow()
  }
  lazy_arrow_cache$has_lazy_arrow
}

# Checks that function_array_stream() is exported and works,
# by building a stream with one batch and reading it back.
check_lazy_arrow <- function() {
  tryCatch(
    {
      if (!("function_array_stream" %in% nanoarrow_exports())) {
        return(FALSE)
      }
      done <- FALSE
      stream <- nanoarrow_function_array_stream(
        function() {
          if (done) {
            return(NULL)
          }
          done <<- TRUE
          nanoarrow::as_nanoarrow_array(1L)
        },
        schema = nanoarrow::na_int32()
      )
      batches <- nanoarrow::collect_array_stream(stream)
      length(batches) == 1 &&
        identical(nanoarrow::convert_array(batches[[1]]), 1L)
    },
    error = function(e) FALSE
  )
}

# Wrappers that can be mocked in tests,
# and that avoid a reference to a function missing from released nanoarrow.
nanoarrow_exports <- function() {
  getNamespaceExports("nanoarrow")
}

nanoarrow_function_array_stream <- function(...) {
  getExportedValue("nanoarrow", "function_array_stream")(...)
}

#' @rdname hidden_aliases
#' @export
setMethod(
  "dbFetchArrow",
  signature("DBIResultArrow"),
  dbFetchArrow_DBIResultArrow
)

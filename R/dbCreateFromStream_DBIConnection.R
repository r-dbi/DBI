#' @rdname hidden_aliases
#' @usage NULL
dbCreateFromStream_DBIConnection <- function(conn, name, value, ..., temporary = FALSE) {
  require_arrow()

  value <- arrow::as_record_batch_reader(value)

  ptype <- get_arrow_ptype(value)
  dbCreateTable(conn, name, ptype, ..., temporary = temporary)
}

get_arrow_ptype <- function(value) {
  schema <- value$schema
  stopifnot(!is.null(schema))

  arrays <- lapply(
    setNames(schema$fields, schema$names),
    function(field) arrow::concat_arrays(type = field$type)
  )
  vectors <- lapply(
    arrays,
    function(array) tryCatch(
      as.vector(array),
      error = function(...) vctrs::unspecified()
    )
  )

  vctrs::new_data_frame(vectors, n = 0L)
}

#' @rdname hidden_aliases
#' @export
setMethod("dbCreateFromStream", signature("DBIConnection"), dbCreateFromStream_DBIConnection)

#' Insert rows into a table from an Arrow stream
#'
#' @description
#' `r lifecycle::badge('experimental')`
#'
#' The `dbAppendTableArrow()` method assumes that the table has been created
#' beforehand, e.g. with [dbCreateTableArrow()].
#' The default implementation calls [dbAppendTable()] for each chunk
#' of the stream.
#' Use [dbAppendTable()] to append data from a data.frame.
#'
#' @inheritParams dbReadTable
#' @param value An object coercible with [nanoarrow::as_nanoarrow_array_stream()].
#' @inheritParams sqlAppendTableTemplate
#'
#' @template methods
#' @templateVar method_name dbAppendTableArrow
#'
#' @inherit DBItest::spec_arrow_append_table_arrow return
#' @inheritSection DBItest::spec_arrow_append_table_arrow Failure modes
#' @inheritSection DBItest::spec_arrow_append_table_arrow Specification
#'
#' @family DBIConnection generics
#' @export
#' @examplesIf requireNamespace("RSQLite", quietly = TRUE) && requireNamespace("nanoarrow", quietly = TRUE)
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#' dbCreateTableArrow(con, "iris", iris[0, ])
#' dbAppendTableArrow(con, "iris", iris[1:5, ])
#' dbReadTable(con, "iris")
#' dbDisconnect(con)
setGeneric("dbAppendTableArrow", def = function(conn, name, value, ...) {
  otel_local_active_span(
    "INSERT INTO",
    conn,
    label = .dbi_get_collection_name(name, conn),
    attributes = list(
      db.collection.name = .dbi_get_collection_name(name, conn),
      db.operation.name = "INSERT INTO"
    )
  )
  standardGeneric("dbAppendTableArrow")
})

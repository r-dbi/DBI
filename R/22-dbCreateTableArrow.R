#' Create a table in the database based on an Arrow object
#'
#' @description
#' `r lifecycle::badge('experimental')`
#'
#' The default `dbCreateTableArrow()` method determines the R data types
#' of the Arrow schema associated with the Arrow object,
#' and calls [dbCreateTable()].
#' Backends that implement [dbAppendTableArrow()] should typically
#' also implement this generic.
#' Use [dbCreateTable()] to create a table from the column types
#' as defined in a data frame.
#'
#' @param value An object for which a schema can be determined via
#'   [nanoarrow::infer_nanoarrow_schema()].
#' @inheritParams dbReadTable
#' @inheritParams sqlCreateTable
#'
#' @inherit DBItest::spec_arrow_create_table_arrow return
#' @inheritSection DBItest::spec_arrow_create_table_arrow Failure modes
#' @inheritSection DBItest::spec_arrow_create_table_arrow Additional arguments
#' @inheritSection DBItest::spec_arrow_create_table_arrow Specification
#'
#' @template methods
#' @templateVar method_name dbCreateTableArrow
#'
#' @family DBIConnection generics
#' @export
#' @examplesIf requireNamespace("RSQLite", quietly = TRUE) && requireNamespace("nanoarrow", quietly = TRUE)
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#' ptype <- data.frame(a = numeric())
#' dbCreateTableArrow(con, "df", nanoarrow::infer_nanoarrow_schema(ptype))
#' dbReadTable(con, "df")
#' dbDisconnect(con)
setGeneric("dbCreateTableArrow",
  def = function(conn, name, value, ..., temporary = FALSE) standardGeneric("dbCreateTableArrow")
)

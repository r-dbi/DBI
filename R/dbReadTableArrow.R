#' Read database tables as Arrow objects
#'
#' @description
#' `r lifecycle::badge('experimental')`
#'
#' Reads a database table as an Arrow object.
#' Use [dbReadTable()] instead to obtain a data frame.
#'
#' @details
#' This function returns an Arrow object.
#' Convert it to a data frame with [as.data.frame()] or
#' use [dbReadTable()] to obtain a data frame.
#'
#' @template methods
#' @templateVar method_name dbReadTableArrow
#'
#' @inherit DBItest::spec_arrow_read_table_arrow return
#' @inheritSection DBItest::spec_arrow_read_table_arrow Failure modes
#' @inheritSection DBItest::spec_arrow_read_table_arrow Specification
#'
#' @inheritParams dbGetQuery
#' @inheritParams dbReadTable
#' @family DBIConnection generics
#' @export
#' @examplesIf requireNamespace("RSQLite", quietly = TRUE) && requireNamespace("nanoarrow", quietly = TRUE)
#' # Read data as Arrow table
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars[1:10, ])
#' dbReadTableArrow(con, "mtcars")
#'
#' dbDisconnect(con)
setGeneric("dbReadTableArrow",
  def = function(conn, name, ...) {
    require_arrow()
    standardGeneric("dbReadTableArrow")
  }
)

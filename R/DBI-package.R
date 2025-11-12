#' @description
#' DBI defines an interface for communication between R and relational database
#' management systems.
#' All classes in this package are virtual and need to be extended by
#' the various R/DBMS implementations (so-called *DBI backends*).
#'
#' @inheritSection DBItest::spec_getting_started Definition
#' @inheritSection DBItest::spec_compliance_methods DBI classes and methods
#' @inheritSection DBItest::spec_driver_constructor Construction of the DBIDriver object
#'
#' @examplesIf requireNamespace("RSQLite", quietly = TRUE)
#' RSQLite::SQLite()
#' @seealso
#'   Important generics: [dbConnect()], [dbGetQuery()],
#'   [dbReadTable()], [dbWriteTable()], [dbDisconnect()]
#'
#'   Formal specification (currently work in progress and incomplete):
#'   `vignette("spec", package = "DBI")`
"_PACKAGE"

has_arrow <- function() {
  requireNamespace("nanoarrow", quietly = TRUE)
}

require_arrow <- function() {
  if (has_arrow()) {
    return(invisible(TRUE))
  }
  stop("The nanoarrow package is required for this functionality.")
}

.onLoad <- function(libname, pkgname) {
  otel_cache_tracer()
}

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
#' @examples
#' RSQLite::SQLite()
#' @seealso
#'   Important generics: [dbConnect()], [dbGetQuery()],
#'   [dbReadTable()], [dbWriteTable()], [dbDisconnect()]
#'
#'   Formal specification (currently work in progress and incomplete):
#'   `vignette("spec", package = "DBI")`
"_PACKAGE"

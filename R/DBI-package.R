#' @description
#' DBI defines an interface for communication between R and relational database
#' management systems.
#' All classes in this package are virtual and need to be extended by
#' the various R/DBMS implementations (so-called *DBI backends*).
#'
#' @inheritSection DBItest::DBIspec Definition
#' @inheritSection DBItest::DBIspec DBI classes and methods
#' @inheritSection DBItest::DBIspec Construction of the DBIDriver object
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

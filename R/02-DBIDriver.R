NULL

#' DBIDriver class
#'
#' Base class for all DBMS drivers (e.g., RSQLite, MySQL, PostgreSQL).
#' The virtual class `DBIDriver` defines the operations for creating
#' connections and defining data type mappings.  Actual driver classes, for
#' instance `RPostgres`, `RMariaDB`, etc. implement these operations in a
#' DBMS-specific manner.
#'
#' @docType class
#' @name DBIDriver-class
#' @family DBI classes
#' @family DBIDriver generics
#' @export
setClass("DBIDriver", contains = c("DBIObject", "VIRTUAL"))

show_driver <- function(object) {
  cat("<", is(object)[1], ">\n", sep = "")
}

findDriver <- function(drvName) {
  # If it exists in the global environment, use that
  d <- get2(drvName, globalenv())
  if (!is.null(d)) return(d)

  # Otherwise, see if the appropriately named package is available
  if (is_attached(drvName)) {
    d <- get2(drvName, asNamespace(drvName))
    if (!is.null(d)) return(d)
  }

  pkgName <- paste0("R", drvName)
  # First, see if package with name R + drvName is available
  if (is_attached(pkgName)) {
    d <- get2(drvName, asNamespace(pkgName))
    if (!is.null(d)) return(d)
  }

  # Can't find it:
  stop(
    "Couldn't find driver ", drvName, ". Looked in:\n",
    "* global namespace\n",
    "* in package called ", drvName, "\n",
    "* in package called ", pkgName,
    call. = FALSE
  )
}

get2 <- function(x, env) {
  if (!exists(x, envir = env)) return(NULL)
  get(x, envir = env)
}

is_attached <- function(x) {
  x %in% loadedNamespaces()
}

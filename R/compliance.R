#' Check a driver for compliance with DBI.
#' 
#' @param driver Driver name.
#' @param pkg Package that driver lives in - is usually "Rdriver"
#' @export
#' @examples
#' if (require("RSQLite")) {
#' dbiCheckCompliance("SQLite")
#' dbiCheckCompliance("NoDriver", "RSQLite")
#' }
dbiCheckCompliance <- function(driver, pkg = paste0("R", driver)) {
  cat("Compliance check for ", driver, "\n", sep = "")
  where <- asNamespace(pkg)
  
  classes <- paste0(driver, names(key_methods))
  names(classes) <- names(key_methods)
  is_class <- vapply(classes, isClass, where = where, FUN.VALUE = logical(1))
  
  if (!all(is_class)) {
    cat("NOT OK\n", 
      "  Missing definitions for classes: ", 
      paste0(classes[!is_class], collapse = ", "), "\n", sep = "")
    return(invisible())
  }  
  
  methods <- Map(function(g, c) has_methods(g, c, where), key_methods, classes)
  names(methods) <- classes
  
  cat(unlist(Map(compliance_message, methods, names(methods))), sep = "\n")
}

has_methods <- function(generic, class, where) {
  vapply(generic, function(x) hasMethod(x, class, where), FUN.VALUE = logical(1))
}

compliance_message <- function(methods, name) {
  if (all(methods)) return(paste0(name, ": OK"))
  
  methods <- paste0(names(methods)[!methods], collapse = ", ")
  paste0(name, ": NOT OK\n", 
    paste0(strwrap(methods, indent = 2, exdent = 2), collapse = "\n"))
}

key_methods <- list(
  Driver = c(
    "dbGetInfo", 
    "dbConnect", 
    "dbUnloadDriver", 
    "dbListConnections", 
    "dbDataType"
  ), 
  Connection = c(
    "dbDisconnect", 
    "dbGetInfo", 
    "dbGetQuery", 
    "dbGetException", 
    "dbListResults", 
    "dbListFields", 
    "dbListTables", 
    "dbReadTable", 
    "dbWriteTable", 
    "dbExistsTable", 
    "dbRemoveTable", 
    "dbBegin",
    "dbCommit", 
    "dbRollback", 
    "dbIsValid",
    "dbQuoteString",
    "dbQuoteIdentifier"
  ), 
  Result = c(
    "dbIsValid", 
    "dbFetch", 
    "dbClearResult", 
    "dbColumnInfo"
  )
)

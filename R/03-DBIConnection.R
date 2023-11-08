#' DBIConnection class
#'
#' This virtual class encapsulates the connection to a DBMS, and it provides
#' access to dynamic queries, result sets, DBMS session management
#' (transactions), etc.
#'
#' @section Implementation note:
#' Individual drivers are free to implement single or multiple simultaneous
#' connections.
#'
#' @docType class
#' @name DBIConnection-class
#' @family DBI classes
#' @family DBIConnection generics
#' @examplesIf requireNamespace("RSQLite", quietly = TRUE)
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#' con
#' dbDisconnect(con)
#' \dontrun{
#' con <- dbConnect(RPostgreSQL::PostgreSQL(), "username", "passsword")
#' con
#' dbDisconnect(con)
#' }
#' @export
setClass("DBIConnection", contains = c("DBIObject", "VIRTUAL"))

show_connection <- function(object) {
  cat("<", is(object)[1], ">\n", sep = "")
  if (!dbIsValid(object)) {
    cat("  DISCONNECTED\n")
  }
}

list_fields <- function(conn, name) {
  rs <- dbSendQuery(
    conn,
    paste(
      "SELECT * FROM ",
      dbQuoteIdentifier(conn, name),
      "LIMIT 0"
    )
  )
  on.exit(dbClearResult(rs))

  names(dbFetch(rs, n = 0, row.names = FALSE))
}

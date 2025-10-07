NULL

#' DBIConnector class
#'
#' Wraps objects of the [DBIDriver-class] class to include connection options.
#' The purpose of this class is to store both the driver
#' and the connection options.
#' A database connection can be established
#' with a call to [dbConnect()], passing only that object
#' without additional arguments.
#'
#' To prevent leakage of passwords and other credentials,
#' this class supports delayed evaluation.
#' All arguments can optionally be a function (callable without arguments).
#' In such a case, the function is evaluated transparently when connecting in
#' [dbGetConnectArgs()].
#'
# FIXME: Include this
# Database backends can take advantage of this feature by returning an
# instance of this class instead of `DBIDriver`.
# See the implementation of [RSQLite::SQLite()]  for an example.
#'
#' @docType class
#' @name DBIConnector-class
#' @family DBI classes
#' @family DBIConnector generics
#' @export
#' @examplesIf requireNamespace("RSQLite", quietly = TRUE)
#' # Create a connector:
#' cnr <- new("DBIConnector",
#'   .drv = RSQLite::SQLite(),
#'   .conn_args = list(dbname = ":memory:")
#' )
#' cnr
#'
#' # Establish a connection through this connector:
#' con <- dbConnect(cnr)
#' con
#'
#' # Access the database through this connection:
#' dbGetQuery(con, "SELECT 1 AS a")
#' dbDisconnect(con)
setClass(
  "DBIConnector",
  slots = c(".drv" = "DBIDriver", ".conn_args" = "list"),
  contains = c("DBIObject")
)

names2 <- function(x) {
  if (is.null(names(x))) {
    rep("", length(x))
  } else {
    names(x)
  }
}

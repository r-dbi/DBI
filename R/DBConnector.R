#' @include hidden.R
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
#' @include DBDriver.R
#' @examples
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
setClass("DBIConnector",
  slots = c(".drv" = "DBIDriver", ".conn_args" = "list"),
  contains = c("DBIObject")
)


#' @rdname hidden_aliases
#' @param object Object to display
#' @export
setMethod("show", signature("DBIConnector"), function(object) {
  cat("<DBIConnector>")
  show(object@.drv)
  cat("Arguments:\n")
  show(object@.conn_args)
  invisible(NULL)
})

#' @rdname hidden_aliases
#' @export
setMethod("dbConnect", signature("DBIConnector"),
  function(drv, ...) {
    dots_args <- list(...)
    has_name <- names2(dots_args) != ""

    # Unnamed dots come first (they are not picked up by modifyList())
    unnamed_dots <- dots_args[!has_name]

    # Named dots come last, an extra drv argument is erased silently
    named_dots <- dots_args[has_name]
    named_dots$drv <- NULL

    # Named dots are supplemented with connector args
    extra_args <- utils::modifyList(
      dbGetConnectArgs(drv),
      named_dots
    )

    all_args <- c(
      list(drv = drv@.drv),
      unnamed_dots,
      extra_args
    )

    do.call(dbConnect, all_args)
  }
)

names2 <- function(x) {
  if (is.null(names(x))) {
    rep("", length(x))
  } else {
    names(x)
  }
}

#' Get connection arguments
#'
#' Returns the arguments stored in a [DBIConnector-class] object for inspection,
#' optionally evaluating them.
#' This function is called by [dbConnect()]
#' and usually does not need to be called directly.
#'
#' @template methods
#' @templateVar method_name dbGetConnectArgs
#'
#' @param drv A object inheriting from [DBIConnector-class].
#' @param eval Set to `FALSE` to return the functions that generate the argument
#'   instead of evaluating them.
#' @param ... Other arguments passed on to methods. Not otherwise used.
#' @family DBIConnector generics
#' @examples
#' cnr <- new("DBIConnector",
#'   .drv = RSQLite::SQLite(),
#'   .conn_args = list(dbname = ":memory:", password = function() "supersecret")
#' )
#' dbGetConnectArgs(cnr)
#' dbGetConnectArgs(cnr, eval = FALSE)
#' @export
setGeneric("dbGetConnectArgs",
  def = function(drv, eval = TRUE, ...) standardGeneric("dbGetConnectArgs"),
  valueClass = "list"
)

#' @rdname hidden_aliases
#' @export
setMethod("dbGetConnectArgs", signature("DBIConnector"), function(drv, eval = TRUE, ...) {
  conn_args <- drv@.conn_args
  if (isTRUE(eval)) {
    conn_args <- lapply(conn_args, function(x) {
      if (is.function(x)) x() else x
    })
  }
  conn_args
})

#' @rdname hidden_aliases
#' @export
setMethod("dbDataType", signature("DBIConnector"), function(dbObj, obj, ...) {
  dbDataType(dbObj@.drv, obj, ...)
})

#' @rdname hidden_aliases
setMethod("dbIsReadOnly", signature("DBIConnector"), function(dbObj, ...) {
  dbIsReadOnly(dbObj@.drv, ...)
})

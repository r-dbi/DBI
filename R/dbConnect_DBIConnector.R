#' @rdname hidden_aliases
#' @usage NULL
dbConnect_DBIConnector <- function(drv, ...) {
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
#' @rdname hidden_aliases
#' @export
setMethod("dbConnect", signature("DBIConnector"), dbConnect_DBIConnector)

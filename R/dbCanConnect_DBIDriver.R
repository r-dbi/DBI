#' @rdname hidden_aliases
#' @usage NULL
dbCanConnect_DBIDriver <- function(drv, ...) {
  tryCatch(
    {
      con <- dbConnect(drv, ...)
      dbDisconnect(con)
      TRUE
    },
    error = function(e) {
      structure(
        FALSE,
        reason = conditionMessage(e)
      )
    }
  )
}
#' @rdname hidden_aliases
#' @export
setMethod("dbCanConnect", signature("DBIDriver"), dbCanConnect_DBIDriver)

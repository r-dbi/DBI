#' @rdname hidden_aliases
#' @usage NULL
dbWithTransaction_DBIConnection <- function(conn, code) {
  ## needs to be a closure, because it accesses conn
  rollback_because <- function(e) {
    call <- dbRollback(conn)
    if (identical(call, FALSE)) {
      stop(
        paste(
          "Failed to rollback transaction.",
          "Tried to roll back because an error",
          "occurred:",
          conditionMessage(e)
        ),
        call. = FALSE
      )
    }
    if (inherits(e, "error")) {
      stop(e)
    }
  }

  ## check if each operation is successful
  call <- dbBegin(conn)
  if (identical(call, FALSE)) {
    stop("Failed to begin transaction", call. = FALSE)
  }
  tryCatch(
    {
      res <- force(code)
      call <- dbCommit(conn)
      if (identical(call, FALSE)) {
        stop("Failed to commit transaction", call. = FALSE)
      }
      res
    },
    dbi_abort = rollback_because,
    error = rollback_because,
    interrupt = rollback_because
  )
}

#' @rdname hidden_aliases
#' @export
setMethod(
  "dbWithTransaction",
  signature("DBIConnection"),
  dbWithTransaction_DBIConnection
)

#' @export
#' @rdname dbWithTransaction
dbBreak <- function() {
  signalCondition(
    structure(
      list(message = "Aborting DBI processing", call = NULL),
      class = c("dbi_abort", "condition")
    )
  )
  stop("Invalid usage of dbBreak().", call. = FALSE)
}

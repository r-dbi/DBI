#' Begin/commit/rollback SQL transactions
#'
#' Not all database engines implement transaction management, in which case
#' these methods should not be implemented for the specific
#' \code{\linkS4class{DBIConnection}} subclass.
#'
#' @section Side Effects:
#' The current transaction on the connections \code{con} is committed or rolled
#' back.
#'
#' @inheritParams dbDisconnect
#' @return a logical indicating whether the operation succeeded or not.
#' @examples
#' \dontrun{
#' ora <- dbDriver("Oracle")
#' con <- dbConnect(ora)
#' rs <- dbSendQuery(con,
#'       "delete * from PURGE as p where p.wavelength<0.03")
#' if(dbGetInfo(rs, what = "rowsAffected") > 250){
#'   warning("dubious deletion -- rolling back transaction")
#'   dbRollback(con)
#' }
#' }
#' @name transactions
NULL

#' @export
#' @rdname transactions
setGeneric("dbBegin",
  def = function(conn, ...) standardGeneric("dbBegin"),
  valueClass = "logical"
)

#' @export
#' @rdname transactions
setGeneric("dbCommit",
  def = function(conn, ...) standardGeneric("dbCommit"),
  valueClass = "logical"
)

#' @export
#' @rdname transactions
setGeneric("dbRollback",
  def = function(conn, ...) standardGeneric("dbRollback"),
  valueClass = "logical"
)

#' Self-contained SQL transactions.
#'
#' Given that \code{\link{transactions}} are implemented, then this function
#' allows you pass in code that is treated as a transaction. The advantage is
#' that you don't have to remember to do \code{dbBegin} and \code{dbCommit} or
#' \code{dbRollback} -- that is all taken care of.
#'
#' @section Side Effects:
#' The transaction in \code{code} on the connection \code{conn} is committed
#' or rolled back. The \code{code} chunk may also also modify the local R
#' environment.
#'
#' @param conn A \code{\linkS4class{DBIConnection}} object, as produced by
#'   \code{\link{dbConnect}}.
#' @param code An arbitrary block of R code
#'
#' @return The result of the evaluation of \code{code}
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#' dbWriteTable(con, "cars", head(cars, 3))
#' dbReadTable(con, "cars")   # there's 3 rows!
#' ## successful transaction
#' dbWithTransaction(con, {
#'   dbExecute(con, "INSERT INTO cars (speed, dist) VALUES (1, 1);")
#'   dbExecute(con, "INSERT INTO cars (speed, dist) VALUES (2, 2);")
#'   dbExecute(con, "INSERT INTO cars (speed, dist) VALUES (3, 3);")
#' })
#' dbReadTable(con, "cars")   # there's now 6 rows!
#'
#' \dontrun{
#' ## unsuccessful transaction -- note the missing comma
#' dbWithTransaction(con,{
#'   dbExecute(con, "INSERT INTO cars (speed, dist) VALUES (1, 1);")
#'   dbExecute(con, "INSERT INTO cars (speed dist) VALUES (2, 2);")
#'   dbExecute(con, "INSERT INTO cars (speed, dist) VALUES (3, 3);")
#' })
#' dbReadTable(con, "cars")   # nothing was changed
#' }
#' dbDisconnect(con)
setGeneric("dbWithTransaction",
  def = function(conn, code) standardGeneric("dbWithTransaction")
)

#' @rdname hidden_aliases
#' @export
setMethod("dbWithTransaction", "DBIConnection", function(conn, code) {
  ## check if each operation is successful
  call <- dbBegin(conn)
  if (identical(call, FALSE)) {
    stop("Failed to begin transaction", call. = FALSE)
  }
  tryCatch({
    res <- force(code)
    call <- dbCommit(conn)
    if (identical(call, FALSE)) {
      stop("Failed to commit transaction", call. = FALSE)
    }
    res
  },
  error = function(e) {
    call <- dbRollback(conn)
    if (identical(call, FALSE)) {
      stop(paste("Failed to rollback transaction.",
                 "Tried to roll back because an error",
                 "occurred:", conditionMessage(e)),
           call. = FALSE)
    }
    stop(e)
  })
})

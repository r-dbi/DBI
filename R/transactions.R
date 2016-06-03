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
#' @inheritParams dbGetQuery
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
#' dbDisconnect(con)
#' }
#'
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#' dbWriteTable(con, "cars", head(cars, 3))
#' dbReadTable(con, "cars")   # there's 3 rows!
#' ## successful transaction
#' withTransaction(con, "INSERT INTO cars (speed, dist)
#'                       VALUES (1, 1), (2, 2), (3, 3);")
#' dbReadTable(con, "cars")   # there's now 6 rows!
#' ## unsuccessful transaction -- note the missing comma
#' withTransaction(con, "INSERT INTO cars (speed, dist)
#'                       VALUES (1, 1) (2, 2), (3, 3);")
#' dbReadTable(con, "cars")   # nothing was changed
#' dbDisconnect(con)
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

#' @aliases withTransaction,DBIConnection-method
#' @export
#' @rdname transactions
setGeneric("withTransaction",
  def = function(conn, statement, ...) standardGeneric("withTransaction"),
  valueClass = "logical"
)

#' @export
setMethod("withTransaction", "DBIConnection", function(conn, statement, ...) {
  dbBegin(conn)
  tryCatch({
    dbExecQuery(conn, statement)
    dbCommit(conn)
    TRUE
  },
  error = function(e) {
    warning(paste("Transaction unsuccesful -- rolling back.",
                  conditionMessage(e)), call. = conditionCall(e))
    dbRollback(conn)
    FALSE
  }
  )
})

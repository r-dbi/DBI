#' @rdname hidden_aliases
#' @usage NULL
dbGetInfo_DBIResult <- function(dbObj, ...) {
  list(
    statement = dbGetStatement(dbObj),
    row.count = dbGetRowCount(dbObj),
    rows.affected = dbGetRowsAffected(dbObj),
    has.completed = dbHasCompleted(dbObj)
  )
}
#' @rdname hidden_aliases
setMethod("dbGetInfo", signature("DBIResult"), dbGetInfo_DBIResult)

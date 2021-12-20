#' Is this DBMS object still valid?
#'
#' This generic tests whether a database object is still valid (i.e. it hasn't
#' been disconnected or cleared).
#'
#' @template methods
#' @templateVar method_name dbIsValid
#'
#' @inherit DBItest::spec_meta_is_valid return
#'
#' @inheritParams dbGetInfo
#' @family DBIDriver generics
#' @family DBIConnection generics
#' @family DBIResult generics
#' @export
#' @examples
#' dbIsValid(RSQLite::SQLite())
#'
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#' dbIsValid(con)
#'
#' rs <- dbSendQuery(con, "SELECT 1")
#' dbIsValid(rs)
#'
#' dbClearResult(rs)
#' dbIsValid(rs)
#'
#' dbDisconnect(con)
#' dbIsValid(con)
setGeneric("dbIsValid",
  def = function(dbObj, ...) standardGeneric("dbIsValid"),
  valueClass = "logical"
)

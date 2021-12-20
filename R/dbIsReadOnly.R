#' Is this DBMS object read only?
#'
#' This generic tests whether a database object is read only.
#'
#' @inheritParams dbGetInfo
#'
#' @template methods
#' @templateVar method_name dbIsReadOnly
#'
#' @family DBIDriver generics
#' @family DBIConnection generics
#' @family DBIResult generics
#' @family DBIConnector generics
#' @export
#' @examples
#' dbIsReadOnly(ANSI())
setGeneric("dbIsReadOnly",
  def = function(dbObj, ...) standardGeneric("dbIsReadOnly"),
  valueClass = "logical")

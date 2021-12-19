#' Get DBMS metadata
#'
#' Retrieves information on objects of class [DBIDriver-class],
#' [DBIConnection-class] or [DBIResult-class].
#'
#' @param dbObj An object inheriting from [DBIObject-class],
#'  i.e. [DBIDriver-class], [DBIConnection-class],
#'  or a [DBIResult-class]
#' @param ... Other arguments to methods.
#' @family DBIDriver generics
#' @family DBIConnection generics
#' @family DBIResult generics
#' @inherit DBItest::spec_get_info return
#' @export
setGeneric("dbGetInfo",
  def = function(dbObj, ...) standardGeneric("dbGetInfo")
)

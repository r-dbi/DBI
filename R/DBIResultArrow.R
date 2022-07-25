#' @rdname DBIResult-class
#' @export
setClass("DBIResultArrow", contains = c("DBIObject", "VIRTUAL"))

#' @rdname DBIResult-class
#' @export
setClass("DBIArrowResult",
  contains = "DBIResultArrow",
  slots = list(
    result = "DBIResult"
  )
)

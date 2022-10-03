#' @rdname DBIResult-class
#' @export
setClass("DBIResultStream", contains = c("DBIObject", "VIRTUAL"))

#' @rdname DBIResult-class
#' @export
setClass("DBIResultStreamDefault",
  contains = "DBIResultStream",
  slots = list(
    result = "DBIResult"
  )
)

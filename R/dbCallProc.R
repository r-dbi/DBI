#' Call an SQL stored procedure
#'
#' **Deprecated since 2014**
#'
#' The recommended way of calling a stored procedure is now
#'
#' \enumerate{
#' \item{\code{\link{dbGetQuery}} if a result set is returned}
#' \item{\code{\link{dbExecute}}  for data manipulation and other cases where no result set is returned}
#' }
#'
#' @inheritParams dbGetQuery
#' @keywords internal
#' @export
setGeneric("dbCallProc",
  def = function(conn, ...) {
    .Deprecated()
    standardGeneric("dbCallProc")
  }
)

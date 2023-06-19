#' @rdname hidden_aliases
#' @usage NULL
dbBindArrow_DBIResult <- function(res, params, ...) {
  dbBind(res, params = param_stream_to_list(params), ...)
}
#' @rdname hidden_aliases
#' @export
setMethod("dbBindArrow", signature("DBIResult"), dbBindArrow_DBIResult)

param_stream_to_list <- function(params) {
  params <- as.list(as.data.frame(params))
  if (all(names(params) == "")) {
    names(params) <- NULL
  }
  params
}

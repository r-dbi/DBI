#' @include DBConnection.R
#' @include DBDriver.R
setClass("AnsiConnection", contains = "DBIConnection")

#' A dummy DBI connector that simulates ANSI-SQL compliance
#'
#' @export
#' @keywords internal
#' @examples
#' ANSI()
ANSI <- function() {
  new("AnsiConnection")
}

#' @export
#' @rdname ANSI
setMethod("show", "AnsiConnection", function(object) {
  cat("<AnsiConnection>\n")
})

#' @export
#' @rdname ANSI
setMethod("dbDataType", c("AnsiConnection", "integer"),  function(dbObj, obj, ...) "INTEGER")
#' @export
#' @rdname ANSI
setMethod("dbDataType", c("AnsiConnection", "numeric"),  function(dbObj, obj, ...) "DOUBLE")
#' @export
#' @rdname ANSI
setMethod("dbDataType", c("AnsiConnection", "logical"),  function(dbObj, obj, ...) "SMALLINT")
#' @export
#' @rdname ANSI
setMethod("dbDataType", c("AnsiConnection", "Date"),     function(dbObj, obj, ...) "DATE")
#' @export
#' @rdname ANSI
setMethod("dbDataType", c("AnsiConnection", "POSIXct"),  function(dbObj, obj, ...) "TIMESTAMP")
varchar <- function(dbObj, obj, ...) {
  paste0("VARCHAR(", max(nchar(as.character(obj))), ")")
}
#' @export
#' @rdname ANSI
setMethod("dbDataType", c("AnsiConnection", "character"), varchar)
#' @export
#' @rdname ANSI
setMethod("dbDataType", c("AnsiConnection", "factor"),    varchar)


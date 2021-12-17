#' @rdname hidden_aliases
#' @usage NULL
dbReadTable_DBIConnection_character <- function(conn, name, ..., row.names = FALSE, check.names = TRUE) {
  sql_name <- dbQuoteIdentifier(conn, x = name, ...)
  if (length(sql_name) != 1L) {
    stop("Invalid name: ", format(name), call. = FALSE)
  }
  if (!is.null(row.names)) {
    stopifnot(length(row.names) == 1L)
    stopifnot(is.logical(row.names) || is.character(row.names))
  }
  stopifnot(length(check.names) == 1L)
  stopifnot(is.logical(check.names))
  stopifnot(!is.na(check.names))

  out <- dbGetQuery(conn, paste0("SELECT * FROM ", sql_name))
  out <- sqlColumnToRownames(out, row.names)
  if (check.names) {
    names(out) <- make.names(names(out), unique = TRUE)
  }
  out
}
#' @rdname hidden_aliases
#' @export
setMethod("dbReadTable", signature("DBIConnection", "character"), dbReadTable_DBIConnection_character)

#' @rdname hidden_aliases
#' @usage NULL
dbListObjects_DBIConnection_ANY <- function(conn, prefix = NULL, ...) {
  names <- dbListTables(conn)
  tables <- lapply(names, function(x) Id(table = x))
  ret <- data.frame(
    table = I(unname(tables)),
    stringsAsFactors = FALSE
  )
  ret$is_prefix <- rep_len(FALSE, nrow(ret))
  ret
}
#' @rdname hidden_aliases
#' @export
setMethod(
  "dbListObjects",
  signature("DBIConnection", "ANY"),
  dbListObjects_DBIConnection_ANY
)

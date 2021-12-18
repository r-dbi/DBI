#' @rdname hidden_aliases
#' @usage NULL
dbUnquoteIdentifier_DBIConnection <- function(conn, x, ...) {
  if (is(x, "SQL")) {
    id_rx <- '(?:"((?:[^"]|"")+)"|([^". ]+))'

    rx <- paste0(
      "^",
      "(?:|(?:|", id_rx, "[.])",
      id_rx, "[.])",
      "(?:|", id_rx, ")",
      "$"
    )

    bad <- grep(rx, x, invert = TRUE)
    if (length(bad) > 0) {
      stop("Can't unquote ", x[bad[[1]]], call. = FALSE)
    }
    catalog <- gsub(rx, "\\1\\2", x)
    catalog <- gsub('""', '"', catalog)
    schema <- gsub(rx, "\\3\\4", x)
    schema <- gsub('""', '"', schema)
    table <- gsub(rx, "\\5\\6", x)
    table <- gsub('""', '"', table)

    ret <- Map(catalog, schema, table, f = as_table)
    names(ret) <- names(x)
    return(ret)
  }
  if (is(x, "Id")) {
    return(list(x))
  }
  stop("x must be SQL or Id", call. = FALSE)
}

#' @rdname hidden_aliases
#' @export
setMethod("dbUnquoteIdentifier", signature("DBIConnection"), dbUnquoteIdentifier_DBIConnection)

as_table <- function(catalog, schema, table) {
  args <- c(catalog = catalog, schema = schema, table = table)
  # Also omits NA args
  args <- args[!is.na(args) & args != ""]
  do.call(Id, as.list(args))
}

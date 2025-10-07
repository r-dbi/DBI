#' @rdname hidden_aliases
#' @usage NULL
sqlAppendTable_DBIConnection <- function(
  con,
  table,
  values,
  row.names = NA,
  ...
) {
  stopifnot(is.list(values))

  if (missing(row.names)) {
    warning(
      "Do not rely on the default value of the row.names argument for sqlAppendTable(), it will change in the future.",
      call. = FALSE
    )
  }

  sql_values <- sqlData(con, values, row.names)
  table <- dbQuoteIdentifier(con, table)
  fields <- dbQuoteIdentifier(con, names(sql_values))

  # Convert fields into a character matrix
  rows <- do.call(paste, c(unname(sql_values), sep = ", "))
  SQL(paste0(
    "INSERT INTO ",
    table,
    "\n",
    "  (",
    paste(fields, collapse = ", "),
    ")\n",
    "VALUES\n",
    paste0("  (", rows, ")", collapse = ",\n")
  ))
}
#' @rdname hidden_aliases
#' @export
setMethod(
  "sqlAppendTable",
  signature("DBIConnection"),
  sqlAppendTable_DBIConnection
)

#' @rdname hidden_aliases
#' @usage NULL
sqlCreateTable_DBIConnection <- function(
  con,
  table,
  fields,
  row.names = NA,
  temporary = FALSE,
  ...
) {
  if (missing(row.names)) {
    warning(
      "Do not rely on the default value of the row.names argument for sqlCreateTable(), it will change in the future.",
      call. = FALSE
    )
  }

  table <- dbQuoteIdentifier(con, table)

  if (is.data.frame(fields)) {
    fields <- sqlRownamesToColumn(fields, row.names)
    fields <- vapply(fields, function(x) DBI::dbDataType(con, x), character(1))
  }

  field_names <- dbQuoteIdentifier(con, names(fields))
  field_types <- unname(fields)
  fields <- paste0(field_names, " ", field_types)

  SQL(paste0(
    "CREATE ",
    if (temporary) "TEMPORARY ",
    "TABLE ",
    table,
    " (\n",
    "  ",
    paste(fields, collapse = ",\n  "),
    "\n)\n"
  ))
}
#' @rdname hidden_aliases
#' @export
setMethod(
  "sqlCreateTable",
  signature("DBIConnection"),
  sqlCreateTable_DBIConnection
)

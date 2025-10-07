#' @rdname sqlAppendTable
#' @inheritParams sqlCreateTable
#' @inheritParams rownames
#' @param prefix Parameter prefix to use for placeholders.
#' @param pattern Parameter pattern to use for placeholders:
#' - `""`: no pattern
#' - `"1"`: position
#' - anything else: field name
#' @export
#' @examples
#' sqlAppendTableTemplate(ANSI(), "iris", iris)
#'
#' sqlAppendTableTemplate(ANSI(), "mtcars", mtcars)
#' sqlAppendTableTemplate(ANSI(), "mtcars", mtcars, row.names = FALSE)
sqlAppendTableTemplate <- function(
  con,
  table,
  values,
  row.names = NA,
  prefix = "?",
  ...,
  pattern = ""
) {
  if (missing(row.names)) {
    warning(
      "Do not rely on the default value of the `row.names` argument to `sqlAppendTableTemplate()`, it will change in the future.",
      call. = FALSE
    )
  }

  if (length(values) == 0) {
    stop("Must pass at least one column in `values`", call. = FALSE)
  }

  table <- dbQuoteIdentifier(con, table)

  if (length(table) != 1) {
    stop("Must pass one table name", call. = FALSE)
  }

  values <- sqlRownamesToColumn(values[0, , drop = FALSE], row.names)
  fields <- dbQuoteIdentifier(con, names(values))

  if (pattern == "") {
    suffix <- rep("", length(fields))
  } else if (pattern == "1") {
    suffix <- as.character(seq_along(fields))
  } else {
    suffix <- names(fields)
  }

  placeholders <- lapply(paste0(prefix, suffix), SQL)
  names(placeholders) <- names(values)

  sqlAppendTable(
    con = con,
    table = table,
    values = placeholders,
    row.names = row.names
  )
}

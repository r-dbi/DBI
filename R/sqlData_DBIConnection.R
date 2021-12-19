#' @rdname hidden_aliases
#' @usage NULL
sqlData_DBIConnection <- function(con, value, row.names = NA, ...) {
  value <- sqlRownamesToColumn(value, row.names)

  # Convert factors to strings
  is_factor <- vapply(value, is.factor, logical(1))
  value[is_factor] <- lapply(value[is_factor], as.character)

  # Quote all strings
  is_char <- vapply(value, is.character, logical(1))
  value[is_char] <- lapply(value[is_char], function(x) {
    enc2utf8(dbQuoteString(con, x))
  })

  # Convert everything to character and turn NAs into NULL
  value[!is_char] <- lapply(value[!is_char], dbQuoteLiteral, conn = con)

  value
}
#' @rdname hidden_aliases
#' @export
setMethod("sqlData", signature("DBIConnection"), sqlData_DBIConnection)

#' @rdname hidden_aliases
#' @usage NULL
sqlInterpolate_DBIConnection <- function(conn, sql, ..., .dots = list()) {
  pos <- sqlParseVariables(conn, sql)

  if (length(pos$start) == 0) {
    return(SQL(sql))
  }

  vars <- substring(sql, pos$start + 1, pos$end)
  positional_vars <- pos$start == pos$end
  if (all(positional_vars) != any(positional_vars)) {
    stop("Can't mix positional (?) and named (?asdf) variables", call. = FALSE)
  }

  values <- c(list(...), .dots)
  if (all(positional_vars)) {
    if (length(vars) != length(values)) {
      stop(
        "Supplied values don't match positional vars to interpolate",
        call. = FALSE
      )
    }
    if (any(names(values) != "")) {
      stop("Positional variables don't take named arguments")
    }
  } else {
    if (!setequal(vars, names(values))) {
      stop(
        "Supplied values don't match named vars to interpolate",
        call. = FALSE
      )
    }
    values <- values[vars]
  }

  safe_values <- vapply(
    values,
    function(x) dbQuoteLiteral(conn, x),
    character(1)
  )

  for (i in rev(seq_along(vars))) {
    sql <- paste0(
      substring(sql, 0, pos$start[i] - 1),
      safe_values[i],
      substring(sql, pos$end[i] + 1, nchar(sql))
    )
  }

  SQL(sql)
}
#' @rdname hidden_aliases
#' @export
setMethod(
  "sqlInterpolate",
  signature("DBIConnection"),
  sqlInterpolate_DBIConnection
)

#' @include hidden.R
NULL

#' Compose query to insert rows into a table
#'
#' `sqlAppendTable()` generates a single SQL string that inserts a
#' data frame into an existing table. `sqlAppendTableTemplate()` generates
#' a template suitable for use with [dbBind()].
#' The default methods are ANSI SQL 99 compliant.
#' These methods are mostly useful for backend implementers.
#'
#' The `row.names` argument must be passed explicitly in order to avoid
#' a compatibility warning.  The default will be changed in a later release.
#'
#' @inheritParams sqlCreateTable
#' @inheritParams rownames
#' @param values A data frame. Factors will be converted to character vectors.
#'   Character vectors will be escaped with [dbQuoteString()].
#' @family SQL generation
#' @export
#' @examples
#' sqlAppendTable(ANSI(), "iris", head(iris))
#'
#' sqlAppendTable(ANSI(), "mtcars", head(mtcars))
#' sqlAppendTable(ANSI(), "mtcars", head(mtcars), row.names = FALSE)
setGeneric("sqlAppendTable",
  def = function(con, table, values, row.names = NA, ...) standardGeneric("sqlAppendTable")
)

#' @rdname hidden_aliases
#' @export
setMethod("sqlAppendTable", signature("DBIConnection"),
  function(con, table, values, row.names = NA, ...) {
    stopifnot(is.list(values))

    if (missing(row.names)) {
      warning("Do not rely on the default value of the row.names argument for sqlAppendTable(), it will change in the future.",
              call. = FALSE
      )
    }

    sql_values <- sqlData(con, values, row.names)
    table <- dbQuoteIdentifier(con, table)
    fields <- dbQuoteIdentifier(con, names(sql_values))

    # Convert fields into a character matrix
    rows <- do.call(paste, c(sql_values, sep = ", "))
    SQL(paste0(
      "INSERT INTO ", table, "\n",
      "  (", paste(fields, collapse = ", "), ")\n",
      "VALUES\n",
      paste0("  (", rows, ")", collapse = ",\n")
    ))
  }
)

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
sqlAppendTableTemplate <- function(con, table, values, row.names = NA, prefix = "?", ..., pattern = "") {
  if (missing(row.names)) {
    warning("Do not rely on the default value of the row.names argument for sqlAppendTableTemplate(), it will change in the future.",
      call. = FALSE
    )
  }

  table <- dbQuoteIdentifier(con, table)

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

#' Insert rows into a table
#'
#' The `dbAppendTable()` method assumes that the table has been created
#' beforehand, e.g. with [dbCreateTable()].
#' The default implementation calls [sqlAppendTableTemplate()] and then
#' [dbExecute()] with the `param` argument. Backends compliant to
#' ANSI SQL 99 which use `?` as a placeholder for prepard queries don't need
#' to override it. Backends with a different SQL syntax which use `?`
#' as a placeholder for prepared queries can override [sqlAppendTable()].
#' Other backends (with different placeholders or with entirely different
#' ways to create tables) need to override the `dbAppendTable()` method.
#'
#' The `row.names` argument is not supported by this method.
#' Process the values with [sqlRownamesToColumn()] before calling this method.
#'
#' @param name Name of the table, escaped with [dbQuoteIdentifier()].
#' @param value A data frame of values. The column names must be consistent
#'   with those in the target table in the database.
#' @param row.names Must be `NULL`.
#' @inheritParams sqlAppendTableTemplate
#' @inheritParams dbDisconnect
#' @family DBIConnection generics
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#' dbCreateTable(con, "iris", iris)
#' dbAppendTable(con, "iris", iris)
#' dbReadTable(con, "iris")
#' dbDisconnect(con)
setGeneric("dbAppendTable",
  def = function(conn, name, value, ..., row.names = NULL) standardGeneric("dbAppendTable")
)

#' @rdname hidden_aliases
#' @export
setMethod("dbAppendTable", signature("DBIConnection"),
  function(conn, name, value, ..., row.names = NULL) {
    stopifnot(is.null(row.names))

    query <- sqlAppendTableTemplate(
      con = conn,
      table = name,
      values = value,
      row.names = row.names,
      prefix = "?",
      pattern = "",
      ...
    )
    values <- sqlRownamesToColumn(value, row.names)
    dbExecute(conn, query, param = unname(as.list(value)))
  }
)

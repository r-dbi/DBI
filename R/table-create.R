#' @include hidden.R
NULL

#' Compose query to create a simple table
#'
#' Exposes an interface to simple `CREATE TABLE` commands. The default
#' method is ANSI SQL 99 compliant.
#' This method is mostly useful for backend implementers.
#'
#' The `row.names` argument must be passed explicitly in order to avoid
#' a compatibility warning.  The default will be changed in a later release.
#'
#' @param con A database connection.
#' @param table Name of the table. Escaped with
#'   [dbQuoteIdentifier()].
#' @param fields Either a character vector or a data frame.
#'
#'   A named character vector: Names are column names, values are types.
#'   Names are escaped with [dbQuoteIdentifier()].
#'   Field types are unescaped.
#'
#'   A data frame: field types are generated using
#'   [dbDataType()].
#' @param temporary If `TRUE`, will generate a temporary table statement.
#' @inheritParams rownames
#' @param ... Other arguments used by individual methods.
#' @export
#' @examples
#' sqlCreateTable(ANSI(), "my-table", c(a = "integer", b = "text"))
#' sqlCreateTable(ANSI(), "my-table", iris)
#'
#' # By default, character row names are converted to a row_names colum
#' sqlCreateTable(ANSI(), "mtcars", mtcars[, 1:5])
#' sqlCreateTable(ANSI(), "mtcars", mtcars[, 1:5], row.names = FALSE)
setGeneric("sqlCreateTable",
  def = function(con, table, fields, row.names = NA, temporary = FALSE, ...) standardGeneric("sqlCreateTable")
)

#' @rdname hidden_aliases
#' @export
setMethod("sqlCreateTable", signature("DBIConnection"),
  function(con, table, fields, row.names = NA, temporary = FALSE, ...) {
    if (missing(row.names)) {
      warning("Do not rely on the default value of the row.names argument for sqlCreateTable(), it will change in the future.",
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
      "CREATE ", if (temporary) "TEMPORARY ", "TABLE ", table, " (\n",
      "  ", paste(fields, collapse = ",\n  "), "\n)\n"
    ))
  }
)

#' Create a table in the database
#'
#' The default `dbCreateTable()` method calls [sqlCreateTable()] and
#' [dbExecute()].
#' Backends compliant to ANSI SQL 99 don't need to override it.
#' Backends with a different SQL syntax can override `sqlCreateTable()`,
#' backends with entirely different ways to create tables need to
#' override this method.
#'
#' The `row.names` argument is not supported by this method.
#' Process the values with [sqlRownamesToColumn()] before calling this method.
#'
#' The argument order is different from the `sqlCreateTable()` method, the
#' latter will be adapted in a later release of DBI.
#'
#' @param name Name of the table, escaped with [dbQuoteIdentifier()].
#' @param row.names Must be `NULL`.
#' @inheritParams sqlCreateTable
#' @inheritParams dbDisconnect
#' @family DBIConnection generics
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#' dbCreateTable(con, "iris", iris)
#' dbReadTable(con, "iris")
#' dbDisconnect(con)
setGeneric("dbCreateTable",
  def = function(conn, name, fields, ..., row.names = NULL, temporary = FALSE) standardGeneric("dbCreateTable")
)

#' @rdname hidden_aliases
#' @export
setMethod("dbCreateTable", signature("DBIConnection"),
  function(conn, name, fields, ..., row.names = NULL, temporary = FALSE) {
    stopifnot(is.null(row.names))

    query <- sqlCreateTable(
      con = conn,
      table = name,
      fields = fields,
      row.names = row.names,
      temporary = temporary,
      ...
    )
    dbExecute(conn, query)
    invisible(TRUE)
  }
)

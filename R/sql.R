#' @include DBConnection.R
NULL

#' Generate SQL: CREATE TABLE
#' 
#' @param conn A subclass of \code{\linkS4class{DBIConnection}} describing
#'   an active database connection.
#' @param name A string giving the table name to create. Escaped with
#'   \code{\link{dbQuoteIdentifier}}
#' @param fields,types Character vectors of equal lengths giving the names
#'   and types of the table's columns. Fields is escaped with 
#'   \code{\link{dbQuoteIdentifier}}. Types is not escaped.
#' @param ... Other arguments passed on to methods. Not otherwise used.
#' @aliases sqlCreateTable,DBIConnection-method
#' @export
#' @examples
#' conn <- setClass("Mock", "DBIConnection")()
#' 
#' sqlCreateTable(conn, "mtcars", names(mtcars), dbDataType(conn, mtcars))
setGeneric("sqlCreateTable", function(conn, name, fields, types, ...) {
  standardGeneric("sqlCreateTable")
}, signature = "conn", valueClass = "SQL")

setMethod("sqlCreateTable", "DBIConnection",
  function(conn, name, fields, types, ...) {
    stopifnot(length(fields) == length(types))
    
    SQL(paste0(
      "CREATE TABLE ", dbQuoteIdentifier(conn, name), " (",
      paste0(dbQuoteIdentifier(conn, fields), " ", types, collapse = ", "),
      ")"
    ))
  }
)

#' Generate SQL: DELETE FROM
#' 
#' @inheritParams sqlCreateTable
#' @param name A string giving the table name to delete from. Escaped with
#'   \code{\link{dbQuoteIdentifier}}
#' @param where An optional string providing an SQL expression used to restrict
#'   the set of rows to be deleted. Not escaped.
#' @aliases sqlDeleteFrom,DBIConnection-method
#' @export
#' @examples
#' conn <- setClass("Mock", "DBIConnection")()
#' 
#' sqlDeleteFrom(conn, "mtcars")
#' sqlDeleteFrom(conn, "mtcars", "cyl = 4")
setGeneric("sqlDeleteFrom", function(conn, name, where = NULL, ...) {
  standardGeneric("sqlDeleteFrom")
}, signature = "conn", valueClass = "SQL")

setMethod("sqlDeleteFrom", "DBIConnection", 
  function(conn, name, where = NULL, ....) {
    sql <- paste0("DELETE FROM ", dbQuoteIdentifier(conn, name))
    if (!is.null(where)) {
      sql <- paste0(sql, " WHERE ", where)
    }
    SQL(sql)
  }
)

#' Generate SQL: DROP TABLE
#' 
#' @inheritParams sqlCreateTable
#' @param name A string giving the table name to drop. Escaped with
#'   \code{\link{dbQuoteIdentifier}}
#' @aliases sqlDropTable,DBIConnection-method
#' @export
#' @examples
#' conn <- setClass("Mock", "DBIConnection")()
#' 
#' sqlDropTable(conn, "mtcars")
setGeneric("sqlDropTable", function(conn, name, ...) {
  standardGeneric("sqlDropTable")
}, signature = "conn", valueClass = "SQL")

setMethod("sqlDropTable", "DBIConnection", 
  function(conn, name, ...) {
    SQL(paste0("DROP TABLE ", dbQuoteIdentifier(conn, name)))
  }
)

#' Generate SQL: INSERT INTO
#' 
#' @inheritParams sqlCreateTable
#' @param name A string giving the table name to insert into. Escaped with
#'   \code{\link{dbQuoteIdentifier}}
#' @param values a data frame containing values to insert into the table. 
#'   Character columns will be escaped with \code{\link{dbQuoteString}}.
#' @param fields The names of the fields to insert into. Defaults to
#'   \code{names(values)}.
#' @aliases sqlInsertInto,DBIConnection-method
#' @return A \code{\link{SQL}} of length \code{nrow(values)}.
#' @export
#' @examples
#' conn <- setClass("Mock", "DBIConnection")()
#' 
#' sqlInsertInto(conn, "mtcars", mtcars)
setGeneric("sqlInsertInto", function(conn, name, values, fields = names(values), ...) {
  standardGeneric("sqlInsertInto")
}, signature = "conn", valueClass = "SQL")

setMethod("sqlInsertInto", "DBIConnection", 
  function(conn, name, values, fields = names(values), ...) {
    stopifnot(is.data.frame(values), length(values) == length(fields))
    
    sql_fields <- paste0(dbQuoteIdentifier(conn, fields), collapse = ", ")
    
    # Escape strings in values
    is_string <- vapply(values, is.character, logical(1))
    values[is_string] <- lapply(values[is_string], dbQuoteString, conn = conn)
    
    # Generate one sql expression per row of input
    values_mat <- do.call("cbind", values)
    values_row <- apply(values_mat, 1, paste, collapse = ", ")
    
    SQL(paste0("INSERT INTO ", dbQuoteIdentifier(conn, name), 
      " (", sql_fields, ") ",
      "VALUES ", values_row))
  }
)

#' Generate SQL: UPDATE
#' 
#' @inheritParams sqlCreateTable
#' @param name A string giving the table name to update. Escaped with
#'   \code{\link{dbQuoteIdentifier}}
#' @param set a named list of character vectors or \code{\link{SQL}} objects.
#'   Not escaped (because it's hard in general to do a good job of it).
#'   Names are escaped with \code{\link{dbQuoteIdentifier}}.
#' @param where An optional string providing an SQL expression used to restrict
#'   the set of rows to be updated. Not escaped.
#' @aliases sqlUpdate,DBIConnection-method
#' @export
#' @examples
#' conn <- setClass("Mock", "DBIConnection")()
#' 
#' sqlUpdate(conn, "mtcars", c(mpg = "mpg / 22"))
setGeneric("sqlUpdate", function(conn, name, set, where = NULL, ...) {
  standardGeneric("sqlUpdate")
}, signature = "conn", valueClass = "SQL")

setMethod("sqlUpdate", "DBIConnection", 
  function(conn, name, set, where = NULL, ...) {
    set_names <- dbQuoteIdentifier(conn, names(set))
    
    SQL(paste0("UPDATE ", dbQuoteIdentifier(conn, name), " SET ", 
      paste0(set_names, " = ", set, collapse = ", "),
      if (!is.null(where)) paste0(" WHERE ", where)
    ))
  }
)

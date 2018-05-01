#' @include table.R
#' @include hidden.R
NULL

#' DBIConnection class
#'
#' This virtual class encapsulates the connection to a DBMS, and it provides
#' access to dynamic queries, result sets, DBMS session management
#' (transactions), etc.
#'
#' @section Implementation note:
#' Individual drivers are free to implement single or multiple simultaneous
#' connections.
#'
#' @docType class
#' @name DBIConnection-class
#' @family DBI classes
#' @family DBIConnection generics
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#' con
#' dbDisconnect(con)
#'
#' \dontrun{
#' con <- dbConnect(RPostgreSQL::PostgreSQL(), "username", "passsword")
#' con
#' dbDisconnect(con)
#' }
#' @export
#' @include DBObject.R
setClass("DBIConnection", contains = c("DBIObject", "VIRTUAL"))

#' @rdname hidden_aliases
#' @param object Object to display
#' @export
setMethod("show", "DBIConnection", function(object) {
  # to protect drivers that fail to implement the required methods (e.g.,
  # RPostgreSQL)
  tryCatch(
    show_connection(object),
    error = function(e) NULL
  )
  invisible(NULL)
})

show_connection <- function(object) {
  cat("<", is(object)[1], ">\n", sep = "")
  if (!dbIsValid(object)) {
    cat("  DISCONNECTED\n")
  }
}

#' Disconnect (close) a connection
#'
#' This closes the connection, discards all pending work, and frees
#' resources (e.g., memory, sockets).
#'
#' @template methods
#' @templateVar method_name dbDisconnect
#'
#' @inherit DBItest::spec_connection_disconnect return
#' @inheritSection DBItest::spec_connection_disconnect Specification
#'
#' @inheritParams dbGetQuery
#' @family DBIConnection generics
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#' dbDisconnect(con)
setGeneric("dbDisconnect",
  def = function(conn, ...) standardGeneric("dbDisconnect")
)

#' Execute a query on a given database connection
#'
#' The `dbSendQuery()` method only submits and synchronously executes the
#' SQL query to the database engine.  It does \emph{not} extract any
#' records --- for that you need to use the [dbFetch()] method, and
#' then you must call [dbClearResult()] when you finish fetching the
#' records you need. For interactive use, you should almost always prefer
#' [dbGetQuery()].
#'
#' This method is for `SELECT` queries only.  Some backends may
#' support data manipulation queries through this method for compatibility
#' reasons.  However, callers are strongly encouraged to use
#' [dbSendStatement()] for data manipulation statements.
#'
#' The query is submitted to the database server and the DBMS executes it,
#' possibly generating vast amounts of data. Where these data live
#' is driver-specific: some drivers may choose to leave the output on the server
#' and transfer them piecemeal to R, others may transfer all the data to the
#' client -- but not necessarily to the memory that R manages. See individual
#' drivers' `dbSendQuery()` documentation for details.
#'
#' @template methods
#' @templateVar method_name dbSendQuery
#'
#' @inherit DBItest::spec_result_send_query return
#' @inheritSection DBItest::spec_result_send_query Additional arguments
#' @inheritSection DBItest::spec_result_send_query Specification
#'
#' @inheritParams dbGetQuery
#' @param statement a character string containing SQL.
#'
#' @family DBIConnection generics
#' @seealso For updates: [dbSendStatement()] and [dbExecute()].
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars)
#' rs <- dbSendQuery(con, "SELECT * FROM mtcars WHERE cyl = 4")
#' dbFetch(rs)
#' dbClearResult(rs)
#'
#' # Pass one set of values with the param argument:
#' rs <- dbSendQuery(
#'   con,
#'   "SELECT * FROM mtcars WHERE cyl = ?",
#'   param = list(4L)
#' )
#' dbFetch(rs)
#' dbClearResult(rs)
#'
#' # Pass multiple sets of values with dbBind():
#' rs <- dbSendQuery(con, "SELECT * FROM mtcars WHERE cyl = ?")
#' dbBind(rs, list(6L))
#' dbFetch(rs)
#' dbBind(rs, list(8L))
#' dbFetch(rs)
#' dbClearResult(rs)
#'
#' dbDisconnect(con)
#' @export
setGeneric("dbSendQuery",
  def = function(conn, statement, ...) standardGeneric("dbSendQuery"),
  valueClass = "DBIResult"
)

#' Execute a data manipulation statement on a given database connection
#'
#' The `dbSendStatement()` method only submits and synchronously executes the
#' SQL data manipulation statement (e.g., `UPDATE`, `DELETE`,
#' `INSERT INTO`, `DROP TABLE`, ...) to the database engine.  To query
#' the number of affected rows, call [dbGetRowsAffected()] on the
#' returned result object.  You must also call [dbClearResult()] after
#' that. For interactive use, you should almost always prefer
#' [dbExecute()].
#'
#' [dbSendStatement()] comes with a default implementation that simply
#' forwards to [dbSendQuery()], to support backends that only
#' implement the latter.
#'
#' @template methods
#' @templateVar method_name dbSendStatement
#'
#' @inherit DBItest::spec_result_send_statement return
#' @inheritSection DBItest::spec_result_send_statement Additional arguments
#' @inheritSection DBItest::spec_result_send_statement Specification
#'
#' @inheritParams dbGetQuery
#' @param statement a character string containing SQL.
#'
#' @family DBIConnection generics
#' @seealso For queries: [dbSendQuery()] and [dbGetQuery()].
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "cars", head(cars, 3))
#'
#' rs <- dbSendStatement(
#'   con,
#'   "INSERT INTO cars (speed, dist) VALUES (1, 1), (2, 2), (3, 3)"
#' )
#' dbHasCompleted(rs)
#' dbGetRowsAffected(rs)
#' dbClearResult(rs)
#' dbReadTable(con, "cars")   # there are now 6 rows
#'
#' # Pass one set of values directly using the param argument:
#' rs <- dbSendStatement(
#'   con,
#'   "INSERT INTO cars (speed, dist) VALUES (?, ?)",
#'   param = list(4L, 5L)
#' )
#' dbClearResult(rs)
#'
#' # Pass multiple sets of values using dbBind():
#' rs <- dbSendStatement(
#'   con,
#'   "INSERT INTO cars (speed, dist) VALUES (?, ?)"
#' )
#' dbBind(rs, list(5:6, 6:7))
#' dbBind(rs, list(7L, 8L))
#' dbClearResult(rs)
#' dbReadTable(con, "cars")   # there are now 10 rows
#'
#' dbDisconnect(con)
#' @export
setGeneric("dbSendStatement",
  def = function(conn, statement, ...) standardGeneric("dbSendStatement"),
  valueClass = "DBIResult"
)

#' @rdname hidden_aliases
#' @export
setMethod(
  "dbSendStatement", signature("DBIConnection", "character"),
  function(conn, statement, ...) {
    dbSendQuery(conn, statement, ...)
  }
)

#' Send query, retrieve results and then clear result set
#'
#' Returns the result of a query as a data frame.
#' `dbGetQuery()` comes with a default implementation
#' (which should work with most backends) that calls
#' [dbSendQuery()], then [dbFetch()], ensuring that
#' the result is always free-d by [dbClearResult()].
#'
#' This method is for `SELECT` queries only
#' (incl. other SQL statements that return a `SELECT`-alike result,
#'  e. g. execution of a stored procedure).
#'
#' To execute a stored procedure that does not return a result set,
#' use [dbExecute()].
#'
#' Some backends may
#' support data manipulation statements through this method for compatibility
#' reasons.  However, callers are strongly advised to use
#' [dbExecute()] for data manipulation statements.
#'
#' @template methods
#' @templateVar method_name dbGetQuery
#'
#' @inherit DBItest::spec_result_get_query return
#' @inheritSection DBItest::spec_result_get_query Additional arguments
#' @inheritSection DBItest::spec_result_get_query Specification
#'
#' @section Implementation notes:
#' Subclasses should override this method only if they provide some sort of
#' performance optimization.
#'
#' @param conn A [DBIConnection-class] object, as returned by
#'   [dbConnect()].
#' @param statement a character string containing SQL.
#' @param ... Other parameters passed on to methods.
#' @family DBIConnection generics
#' @seealso For updates: [dbSendStatement()] and [dbExecute()].
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars)
#' dbGetQuery(con, "SELECT * FROM mtcars")
#' dbGetQuery(con, "SELECT * FROM mtcars", n = 6)
#'
#' # Pass values using the param argument:
#' # (This query runs eight times, once for each different
#' # parameter. The resulting rows are combined into a single
#' # data frame.)
#' dbGetQuery(con, "SELECT COUNT(*) FROM mtcars WHERE cyl = ?", param = list(1:8))
#'
#' dbDisconnect(con)
setGeneric("dbGetQuery",
  def = function(conn, statement, ...) standardGeneric("dbGetQuery")
)

#' @rdname hidden_aliases
#' @param n Number of rows to fetch, default -1
#' @export
setMethod("dbGetQuery", signature("DBIConnection", "character"),
  function(conn, statement, ..., n = -1L) {
    rs <- dbSendQuery(conn, statement, ...)
    on.exit(dbClearResult(rs))

    dbFetch(rs, n = n, ...)
  }
)

#' Execute an update statement, query number of rows affected, and then close result set
#'
#' Executes a statement and returns the number of rows affected.
#' `dbExecute()` comes with a default implementation
#' (which should work with most backends) that calls
#' [dbSendStatement()], then [dbGetRowsAffected()], ensuring that
#' the result is always free-d by [dbClearResult()].
#'
#' You can also use `dbExecute()` to call a stored procedure
#' that performs data manipulation or other actions that do not return a result set.
#' To execute a stored procedure that returns a result set use [dbGetQuery()] instead.
#'
#' @template methods
#' @templateVar method_name dbExecute
#'
#' @section Implementation notes:
#' Subclasses should override this method only if they provide some sort of
#' performance optimization.
#'
#' @inherit DBItest::spec_result_execute return
#' @inheritSection DBItest::spec_result_execute Additional arguments
#' @inheritSection DBItest::spec_result_execute Specification
#'
#' @inheritParams dbGetQuery
#' @param statement a character string containing SQL.
#' @family DBIConnection generics
#' @seealso For queries: [dbSendQuery()] and [dbGetQuery()].
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "cars", head(cars, 3))
#' dbReadTable(con, "cars")   # there are 3 rows
#' dbExecute(
#'   con,
#'   "INSERT INTO cars (speed, dist) VALUES (1, 1), (2, 2), (3, 3)"
#' )
#' dbReadTable(con, "cars")   # there are now 6 rows
#'
#' # Pass values using the param argument:
#' dbExecute(
#'   con,
#'   "INSERT INTO cars (speed, dist) VALUES (?, ?)",
#'   param = list(4:7, 5:8)
#' )
#' dbReadTable(con, "cars")   # there are now 10 rows
#'
#' dbDisconnect(con)
setGeneric("dbExecute",
  def = function(conn, statement, ...) standardGeneric("dbExecute")
)

#' @rdname hidden_aliases
#' @export
setMethod(
  "dbExecute", signature("DBIConnection", "character"),
  function(conn, statement, ...) {
    rs <- dbSendStatement(conn, statement, ...)
    on.exit(dbClearResult(rs))
    dbGetRowsAffected(rs)
  }
)

#' Get DBMS exceptions
#'
#' DEPRECATED. Backends should use R's condition system to signal errors and
#' warnings.
#'
#' @inheritParams dbGetQuery
#' @family DBIConnection generics
#' @return a list with elements `errorNum` (an integer error number) and
#'   `errorMsg` (a character string) describing the last error in the
#'   connection `conn`.
#' @export
setGeneric("dbGetException",
  def = function(conn, ...) standardGeneric("dbGetException")
)

#' A list of all pending results
#'
#' DEPRECATED. DBI currenty supports only one open result set per connection,
#' you need to keep track of the result sets you open if you need this
#' functionality.
#'
#' @inheritParams dbGetQuery
#' @family DBIConnection generics
#' @return a list. If no results are active, an empty list. If only
#'   a single result is active, a list with one element.
#' @export
setGeneric("dbListResults",
  def = function(conn, ...) standardGeneric("dbListResults")
)

#' List field names of a remote table
#'
#' @inheritParams dbGetQuery
#' @param name a character string with the name of the remote table.
#'
#' @inherit DBItest::spec_sql_list_fields return
#' @inheritSection DBItest::spec_sql_list_fields Specification
#'
#' @family DBIConnection generics
#' @seealso [dbColumnInfo()] to get the type of the fields.
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars)
#' dbListFields(con, "mtcars")
#'
#' dbDisconnect(con)
setGeneric("dbListFields",
  def = function(conn, name, ...) standardGeneric("dbListFields"),
  valueClass = "character"
)

#' @rdname hidden_aliases
#' @export
setMethod("dbListFields", signature("DBIConnection", "character"),
  function(conn, name, ...) {
    list_fields(conn, name)
  }
)

#' @rdname hidden_aliases
#' @export
setMethod("dbListFields", signature("DBIConnection", "Id"),
  function(conn, name, ...) {
    list_fields(conn, name)
  }
)

list_fields <- function(conn, name) {
  rs <- dbSendQuery(
    conn,
    paste(
      "SELECT * FROM ",
      dbQuoteIdentifier(conn, name),
      "LIMIT 0"
    )
  )
  on.exit(dbClearResult(rs))

  names(dbFetch(rs, n = 0, row.names = FALSE))
}

#' List remote tables
#'
#' Returns the unquoted names of remote tables accessible through this
#' connection.
#' This should include views and temporary objects, but not all database backends
#' (in particular \pkg{RMariaDB} and \pkg{RMySQL}) support this.
#'
#' @template methods
#' @templateVar method_name dbListTables
#'
#' @inherit DBItest::spec_sql_list_tables return
#'
#' @inheritParams dbGetQuery
#' @family DBIConnection generics
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbListTables(con)
#' dbWriteTable(con, "mtcars", mtcars)
#' dbListTables(con)
#'
#' dbDisconnect(con)
setGeneric("dbListTables",
  def = function(conn, ...) standardGeneric("dbListTables"),
  valueClass = "character"
)

#' List remote objects
#'
#' Returns the names of remote objects accessible through this connection
#' as a data frame.
#' This should include temporary objects, but not all database backends
#' (in particular \pkg{RMariaDB} and \pkg{RMySQL}) support this.
#' Compared to [dbListTables()], this method also enumerates tables and views
#' in schemas, and returns fully qualified identifiers to access these objects.
#' This allows exploration of all database objects available to the current
#' user, including those that can only be accessed by giving the full
#' namespace.
#'
#' @template methods
#' @templateVar method_name dbListObjects
#'
#' @inherit DBItest::spec_sql_list_objects return
#' @inheritSection DBItest::spec_sql_list_objects Additional arguments
#' @inheritSection DBItest::spec_sql_list_objects Specification
#'
#' @inheritParams dbGetQuery
#' @param prefix A fully qualified path in the database's namespace, or `NULL`.
#'   This argument will be processed with [dbUnquoteIdentifier()].
#'   If given the method will return all objects accessible through this prefix.
#' @family DBIConnection generics
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbListObjects(con)
#' dbWriteTable(con, "mtcars", mtcars)
#' dbListObjects(con)
#'
#' dbDisconnect(con)
setGeneric("dbListObjects",
  def = function(conn, prefix = NULL, ...) standardGeneric("dbListObjects"),
  valueClass = "data.frame"
)

#' @rdname hidden_aliases
#' @export
setMethod("dbListObjects", signature("DBIConnection", "ANY"),
  function(conn, prefix = NULL, ...) {
    names <- dbListTables(conn)
    tables <- lapply(names, function(x) Id(table = x))
    ret <- data.frame(
      table = I(unname(tables)),
      stringsAsFactors = FALSE
    )
    ret$is_prefix <- rep_len(FALSE, nrow(ret))
    ret
  }
)

#' Copy data frames from database tables
#'
#' Reads a database table to a data frame, optionally converting
#' a column to row names and converting the column names to valid
#' R identifiers.
#'
#' @template methods
#' @templateVar method_name dbReadTable
#'
#' @inherit DBItest::spec_sql_read_table return
#' @inheritSection DBItest::spec_sql_read_table Additional arguments
#' @inheritSection DBItest::spec_sql_read_table Specification
#'
#' @inheritParams dbGetQuery
#' @param name A character string specifying the unquoted DBMS table name,
#'   or the result of a call to [dbQuoteIdentifier()].
#' @family DBIConnection generics
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars[1:10, ])
#' dbReadTable(con, "mtcars")
#'
#' dbDisconnect(con)
setGeneric("dbReadTable",
  def = function(conn, name, ...) standardGeneric("dbReadTable"),
  valueClass = "data.frame"
)

#' @rdname hidden_aliases
#' @export
setMethod("dbReadTable", signature("DBIConnection", "character"),
  function(conn, name, ..., row.names = FALSE, check.names = TRUE) {
    sql_name <- dbQuoteIdentifier(conn, x = name, ...)
    if (length(sql_name) != 1L) {
      stop("Invalid name: ", format(name), call. = FALSE)
    }
    if (!is.null(row.names)) {
      stopifnot(length(row.names) == 1L)
      stopifnot(is.logical(row.names) || is.character(row.names))
    }
    stopifnot(length(check.names) == 1L)
    stopifnot(is.logical(check.names))
    stopifnot(!is.na(check.names))

    out <- dbGetQuery(conn, paste0("SELECT * FROM ", sql_name))
    out <- sqlColumnToRownames(out, row.names)
    if (check.names) {
      names(out) <- make.names(names(out), unique = TRUE)
    }
    out
  }
)

#' @rdname hidden_aliases
#' @export
setMethod("dbReadTable", signature("DBIConnection", "Id"),
  function(conn, name, ...) {
    dbReadTable(conn, dbQuoteIdentifier(conn, name), ...)
  }
)

#' Copy data frames to database tables
#'
#' Writes, overwrites or appends a data frame to a database table, optionally
#' converting row names to a column and specifying SQL data types for fields.
#'
#' @template methods
#' @templateVar method_name dbWriteTable
#'
#' @inherit DBItest::spec_sql_write_table return
#' @inheritSection DBItest::spec_sql_write_table Additional arguments
#' @inheritSection DBItest::spec_sql_write_table Specification
#'
#' @inheritParams dbGetQuery
#' @inheritParams dbReadTable
#' @param value a [data.frame] (or coercible to data.frame).
#' @family DBIConnection generics
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbWriteTable(con, "mtcars", mtcars[1:5, ])
#' dbReadTable(con, "mtcars")
#'
#' dbWriteTable(con, "mtcars", mtcars[6:10, ], append = TRUE)
#' dbReadTable(con, "mtcars")
#'
#' dbWriteTable(con, "mtcars", mtcars[1:10, ], overwrite = TRUE)
#' dbReadTable(con, "mtcars")
#'
#' # No row names
#' dbWriteTable(con, "mtcars", mtcars[1:10, ], overwrite = TRUE, row.names = FALSE)
#' dbReadTable(con, "mtcars")
#'
#' @export
setGeneric("dbWriteTable",
  def = function(conn, name, value, ...) standardGeneric("dbWriteTable")
)

#' @rdname hidden_aliases
#' @export
setMethod("dbWriteTable", signature("DBIConnection", "Id", "ANY"),
  function(conn, name, value, ...) {
    dbWriteTable(conn, dbQuoteIdentifier(conn, name), value, ...)
  }
)

#' Does a table exist?
#'
#' Returns if a table given by name exists in the database.
#'
#' @template methods
#' @templateVar method_name dbExistsTable
#'
#' @inherit DBItest::spec_sql_exists_table return
#' @inheritSection DBItest::spec_sql_exists_table Specification
#'
#' @inheritParams dbGetQuery
#' @param name A character string specifying a DBMS table name.
#' @family DBIConnection generics
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbExistsTable(con, "iris")
#' dbWriteTable(con, "iris", iris)
#' dbExistsTable(con, "iris")
#'
#' dbDisconnect(con)
setGeneric("dbExistsTable",
  def = function(conn, name, ...) standardGeneric("dbExistsTable"),
  valueClass = "logical"
)

#' @rdname hidden_aliases
#' @export
setMethod("dbExistsTable", signature("DBIConnection", "Id"),
  function(conn, name, ...) {
    dbExistsTable(conn, dbQuoteIdentifier(conn, name), ...)
  }
)

#' Remove a table from the database
#'
#' Remove a remote table (e.g., created by [dbWriteTable()])
#' from the database.
#'
#' @template methods
#' @templateVar method_name dbRemoveTable
#'
#' @inherit DBItest::spec_sql_remove_table return
#' @inheritSection DBItest::spec_sql_remove_table Additional arguments
#' @inheritSection DBItest::spec_sql_remove_table Specification
#'
#' @inheritParams dbGetQuery
#' @param name A character string specifying a DBMS table name.
#' @family DBIConnection generics
#' @export
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#'
#' dbExistsTable(con, "iris")
#' dbWriteTable(con, "iris", iris)
#' dbExistsTable(con, "iris")
#' dbRemoveTable(con, "iris")
#' dbExistsTable(con, "iris")
#'
#' dbDisconnect(con)
setGeneric("dbRemoveTable",
  def = function(conn, name, ...) standardGeneric("dbRemoveTable")
)

#' @rdname hidden_aliases
#' @export
setMethod("dbRemoveTable", signature("DBIConnection", "Id"),
  function(conn, name, ...) {
    dbRemoveTable(conn, dbQuoteIdentifier(conn, name), ...)
  }
)

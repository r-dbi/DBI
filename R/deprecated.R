#' @include hidden.R
NULL

#' Make R identifiers into legal SQL identifiers
#'
#' These methods are DEPRECATED. Please use [dbQuoteIdentifier()]
#' (or possibly [dbQuoteString()]) instead.
#'
#' The algorithm in `make.db.names` first invokes `make.names` and
#' then replaces each occurrence of a dot `.` by an underscore `_`.  If
#' `allow.keywords` is `FALSE` and identifiers collide with SQL
#' keywords, a small integer is appended to the identifier in the form of
#' `"_n"`.
#'
#' The set of SQL keywords is stored in the character vector
#' `.SQL92Keywords` and reflects the SQL ANSI/ISO standard as documented
#' in "X/Open SQL and RDA", 1994, ISBN 1-872630-68-8.  Users can easily
#' override or update this vector.
#'
#' @section Bugs:
#' The current mapping is not guaranteed to be fully reversible: some SQL
#' identifiers that get mapped into R identifiers with `make.names` and
#' then back to SQL with [make.db.names()] will not be equal to the
#' original SQL identifiers (e.g., compound SQL identifiers of the form
#' `username.tablename` will loose the dot ``.'').
#'
#' @references The set of SQL keywords is stored in the character vector
#'   `.SQL92Keywords` and reflects the SQL ANSI/ISO standard as documented
#'   in "X/Open SQL and RDA", 1994, ISBN 1-872630-68-8.  Users can easily
#'   override or update this vector.
#' @aliases
#'    make.db.names
#'    SQLKeywords
#'    isSQLKeyword
#' @param dbObj any DBI object (e.g., `DBIDriver`).
#' @param snames a character vector of R identifiers (symbols) from which we
#'   need to make SQL identifiers.
#' @param name a character vector with database identifier candidates we need
#'   to determine whether they are legal SQL identifiers or not.
#' @param unique logical describing whether the resulting set of SQL names
#'   should be unique.  Its default is `TRUE`.  Following the SQL 92
#'   standard, uniqueness of SQL identifiers is determined regardless of whether
#'   letters are upper or lower case.
#' @param allow.keywords logical describing whether SQL keywords should be
#'   allowed in the resulting set of SQL names.  Its default is `TRUE`
#' @param keywords a character vector with SQL keywords, by default it's
#'   `.SQL92Keywords` defined by the DBI.
#' @param case a character string specifying whether to make the comparison as
#'   lower case, upper case, or any of the two.  it defaults to `any`.
#' @param \dots any other argument are passed to the driver implementation.
#' @return `make.db.names` returns a character vector of legal SQL
#'   identifiers corresponding to its `snames` argument.
#'
#'   `SQLKeywords` returns a character vector of all known keywords for the
#'   database-engine associated with `dbObj`.
#'
#'   `isSQLKeyword` returns a logical vector parallel to `name`.
#' @export
setGeneric("make.db.names",
  def = function(dbObj, snames, keywords = .SQL92Keywords, unique = TRUE, allow.keywords = TRUE, ...) standardGeneric("make.db.names"),
  signature = c("dbObj", "snames"),
  valueClass = "character"
)

#' @rdname hidden_aliases
setMethod("make.db.names", signature(dbObj = "DBIObject", snames = "character"),
  definition = function(dbObj, snames, keywords, unique, allow.keywords, ...) {
    make.db.names.default(snames, keywords, unique, allow.keywords)
  },
  valueClass = "character"
)

## produce legal SQL identifiers from strings in a character vector
## unique, in this function, means unique regardless of lower/upper case

#' @rdname make.db.names
#' @export
make.db.names.default <- function(snames, keywords = .SQL92Keywords,
                                  unique = TRUE, allow.keywords = TRUE) {
  makeUnique <- function(x, sep = "_") {
    if (length(x) == 0) return(x)
    out <- x
    lc <- make.names(tolower(x), unique = FALSE)
    i <- duplicated(lc)
    lc <- make.names(lc, unique = TRUE)
    out[i] <- paste(out[i], substring(lc[i], first = nchar(out[i]) + 1), sep = sep)
    out
  }
  ## Note: SQL identifiers *can* be enclosed in double or single quotes
  ## when they are equal to reserverd keywords.
  fc <- substring(snames, 1, 1)
  lc <- substring(snames, nchar(snames))
  i <- match(fc, c("'", '"'), 0) > 0 & match(lc, c("'", '"'), 0) > 0
  snames[!i] <- make.names(snames[!i], unique = FALSE)
  if (unique) {
    snames[!i] <- makeUnique(snames[!i])
  }
  if (!allow.keywords) {
    kwi <- match(keywords, toupper(snames), nomatch = 0L)
    snames[kwi] <- paste('"', snames[kwi], '"', sep = "")
  }
  gsub("\\.", "_", snames)
}

#' @rdname make.db.names
#' @export
setGeneric("isSQLKeyword",
  def = function(dbObj, name, keywords = .SQL92Keywords, case = c("lower", "upper", "any")[3], ...)
    standardGeneric("isSQLKeyword"),
  signature = c("dbObj", "name"),
  valueClass = "logical"
)

#' @rdname hidden_aliases
setMethod("isSQLKeyword", signature(dbObj = "DBIObject", name = "character"),
  definition = function(dbObj, name, keywords, case, ...)
    isSQLKeyword.default(name, keywords, case),
  valueClass = "logical"
)

#' @rdname make.db.names
#' @export
isSQLKeyword.default <- function(name, keywords = .SQL92Keywords,
                                 case = c("lower", "upper", "any")[3]) {
  n <- pmatch(case, c("lower", "upper", "any"), nomatch = 0)
  if (n == 0) {
    stop('case must be one of "lower", "upper", or "any"')
  }
  kw <- switch(c("lower", "upper", "any")[n],
    lower = tolower(keywords),
    upper = toupper(keywords),
    any = toupper(keywords)
  )
  if (n == 3) {
    name <- toupper(name)
  }
  match(name, keywords, nomatch = 0) > 0
}

## SQL ANSI 92 (plus ISO's) keywords --- all 220 of them!
## (See pp. 22 and 23 in X/Open SQL and RDA, 1994, isbn 1-872630-68-8)

#' @export
setGeneric("SQLKeywords",
  def = function(dbObj, ...) standardGeneric("SQLKeywords"),
  valueClass = "character"
)

#' @rdname hidden_aliases
setMethod("SQLKeywords", signature("DBIObject"),
  definition = function(dbObj, ...) .SQL92Keywords,
  valueClass = "character"
)

#' @rdname hidden_aliases
setMethod("SQLKeywords", signature("missing"),
  definition = function(dbObj, ...) .SQL92Keywords,
  valueClass = "character"
)

#' @export
.SQL92Keywords <- c(
  "ABSOLUTE", "ADD", "ALL", "ALLOCATE", "ALTER", "AND", "ANY",
  "ARE", "AS", "ASC", "ASSERTION", "AT", "AUTHORIZATION", "AVG", "BEGIN",
  "BETWEEN", "BIT", "BIT_LENGTH", "BY", "CASCADE", "CASCADED", "CASE", "CAST",
  "CATALOG", "CHAR", "CHARACTER", "CHARACTER_LENGTH", "CHAR_LENGTH",
  "CHECK", "CLOSE", "COALESCE", "COLLATE", "COLLATION", "COLUMN",
  "COMMIT", "CONNECT", "CONNECTION", "CONSTRAINT", "CONSTRAINTS",
  "CONTINUE", "CONVERT", "CORRESPONDING", "COUNT", "CREATE", "CURRENT",
  "CURRENT_DATE", "CURRENT_TIMESTAMP", "CURRENT_TYPE", "CURSOR", "DATE",
  "DAY", "DEALLOCATE", "DEC", "DECIMAL", "DECLARE", "DEFAULT",
  "DEFERRABLE", "DEFERRED", "DELETE", "DESC", "DESCRIBE", "DESCRIPTOR",
  "DIAGNOSTICS", "DICONNECT", "DICTIONATRY", "DISPLACEMENT", "DISTINCT",
  "DOMAIN", "DOUBLE", "DROP", "ELSE", "END", "END-EXEC", "ESCAPE",
  "EXCEPT", "EXCEPTION", "EXEC", "EXECUTE", "EXISTS", "EXTERNAL",
  "EXTRACT", "FALSE", "FETCH", "FIRST", "FLOAT", "FOR", "FOREIGN",
  "FOUND", "FROM", "FULL", "GET", "GLOBAL", "GO", "GOTO", "GRANT",
  "GROUP", "HAVING", "HOUR", "IDENTITY", "IGNORE", "IMMEDIATE", "IN",
  "INCLUDE", "INDEX", "INDICATOR", "INITIALLY", "INNER", "INPUT",
  "INSENSITIVE", "INSERT", "INT", "INTEGER", "INTERSECT", "INTERVAL",
  "INTO", "IS", "ISOLATION", "JOIN", "KEY", "LANGUAGE", "LAST", "LEFT",
  "LEVEL", "LIKE", "LOCAL", "LOWER", "MATCH", "MAX", "MIN", "MINUTE",
  "MODULE", "MONTH", "NAMES", "NATIONAL", "NCHAR", "NEXT", "NOT", "NULL",
  "NULLIF", "NUMERIC", "OCTECT_LENGTH", "OF", "OFF", "ONLY", "OPEN",
  "OPTION", "OR", "ORDER", "OUTER", "OUTPUT", "OVERLAPS", "PARTIAL",
  "POSITION", "PRECISION", "PREPARE", "PRESERVE", "PRIMARY", "PRIOR",
  "PRIVILEGES", "PROCEDURE", "PUBLIC", "READ", "REAL", "REFERENCES",
  "RESTRICT", "REVOKE", "RIGHT", "ROLLBACK", "ROWS", "SCHEMA", "SCROLL",
  "SECOND", "SECTION", "SELECT", "SET", "SIZE", "SMALLINT", "SOME", "SQL",
  "SQLCA", "SQLCODE", "SQLERROR", "SQLSTATE", "SQLWARNING", "SUBSTRING",
  "SUM", "SYSTEM", "TABLE", "TEMPORARY", "THEN", "TIME", "TIMESTAMP",
  "TIMEZONE_HOUR", "TIMEZONE_MINUTE", "TO", "TRANSACTION", "TRANSLATE",
  "TRANSLATION", "TRUE", "UNION", "UNIQUE", "UNKNOWN", "UPDATE", "UPPER",
  "USAGE", "USER", "USING", "VALUE", "VALUES", "VARCHAR", "VARYING",
  "VIEW", "WHEN", "WHENEVER", "WHERE", "WITH", "WORK", "WRITE", "YEAR",
  "ZONE"
)


#' Call an SQL stored procedure
#'
#' **Deprecated since 2014**
#'
#' The recommended way of calling a stored procedure is now
#'
#' \enumerate{
#' \item{\code{\link{dbGetQuery}} if a result set is returned}
#' \item{\code{\link{dbExecute}}  for data manipulation and other cases where no result set is returned}
#' }
#'
#' @inheritParams dbGetQuery
#' @keywords internal
#' @export
setGeneric("dbCallProc",
  def = function(conn, ...) {
    .Deprecated()
    standardGeneric("dbCallProc")
  }
)

#' Determine the current version of the package.
#'
#' @export
#' @keywords internal
dbGetDBIVersion <- function() {
  .Deprecated("packageVersion('DBI')")
  utils::packageVersion("DBI")
}

#' Set data mappings between an DBMS and R.
#'
#' This generic is deprecated since no working implementation was ever produced.
#'
#' Sets one or more conversion functions to handle the translation of DBMS data
#' types to R objects.  This is only needed for non-primitive data, since all
#' DBI drivers handle the common base types (integers, numeric, strings, etc.)
#'
#' The details on conversion functions (e.g., arguments, whether they can invoke
#' initializers and/or destructors) have not been specified.
#'
#' @inheritParams dbClearResult
#' @keywords internal
#' @param flds a field description object as returned by `dbColumnInfo`.
#' @export
setGeneric("dbSetDataMappings",
  def = function(res, flds, ...) {
    .Deprecated()
    standardGeneric("dbSetDataMappings")
  }
)

NULL

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

#' Keywords according to the SQL-92 sta
#'
#' A character vector of SQL-92 keywords, uppercase.
#'
#' @export
#' @examples
#' "SELECT" %in% .SQL92Keywords
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

#' Determine the current version of the package.
#'
#' @export
#' @keywords internal
dbGetDBIVersion <- function() {
  .Deprecated("packageVersion('DBI')")
  utils::packageVersion("DBI")
}

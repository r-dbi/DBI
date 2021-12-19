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
#' @keywords internal
setGeneric("make.db.names",
  def = function(dbObj, snames, keywords = .SQL92Keywords, unique = TRUE, allow.keywords = TRUE, ...) standardGeneric("make.db.names"),
  signature = c("dbObj", "snames"),
  valueClass = "character"
)

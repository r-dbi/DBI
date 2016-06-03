# DBI 0.4-2

* Added `dbExecute` function.
* Added `dbGetChunkedQuery` function.
* Added `dbWithTransaction` function.

# DBI 0.4-1 (2016-05-07)

- The default `show()` implementations silently ignore all errors.  Some DBI drivers (e.g., RPostgreSQL) might fail to implement `dbIsValid()` or the other methods used.


# DBI 0.4 (2016-04-30)

* New package maintainer: Kirill Müller.

* `dbGetInfo()` gains a default method that extracts the information from
  `dbGetStatement()`, `dbGetRowsAffected()`, `dbHasCompleted()`, and 
  `dbGetRowCount()`. This means that most drivers should no longer need to
  implement `dbGetInfo()` (which may be deprecated anyway at some point) (#55).

* `dbDataType()` and `dbQuoteString()` are now properly exported.

* The default implementation for `dbDataType()` (powered by `dbiDataType()`) now
  also supports `difftime` and `AsIs` objects and lists of `raw` (#70).

* Default `dbGetQuery()` method now always calls `dbFetch()`, in a `tryCatch()`
  block.

* New generic `dbBind()` for binding values to a parameterised query.

* DBI gains a number of SQL generation functions. These make it easier to 
  write backends by implementing common operations that are slightly
  tricky to do absolutely correctly. 
  
    * `sqlCreateTable()` and `sqlAppendTable()` create tables from a data
      frame and insert rows into an existing table. These will power most
      implementations of `dbWriteTable()`. `sqlAppendTable()` is useful
      for databases that support parameterised queries.
      
    * `sqlRownamesToColumn()` and `sqlColumnToRownames()` provide a standard
      way of translating row names to and from the database.
      
    * `sqlInterpolate()` and `sqlParseVariables()` allows databases without
      native parameterised queries to use parameterised queries to avoid
      SQL injection attacks.
      
    * `sqlData()` is a new generic that converts a data frame into a data
      frame suitable for sending to the database. This is used to (e.g.) 
      ensure all character vectors are encoded as UTF-8, or to convert
      R varible types (like factor) to types supported by the database.

    * The `sqlParseVariablesImpl()` is now implemented purely in R, with full
      test coverage (#83, @hannesmuehleisen).

* `dbiCheckCompliance()` has been removed, the functionality is now available
  in the `DBItest` package (#80).

* Added default `show()` methods for driver, connection and results.

* New concrete `ANSIConnection` class and `ANSI()` function to generate a dummy
  ANSI compliant connection useful for testing.

* Default `dbQuoteString()` and `dbQuoteIdentifer()` methods now use 
  `encodeString()` so that special characters like `\n` are correctly escaped.
  `dbQuoteString()` converts `NA` to (unquoted) NULL.

* The initial DBI proposal and DBI version 1 specification are now included as 
  a vignette. These are there mostly for historical interest.

* The new `DBItest` package is described in the vignette.

* Deprecated `print.list.pairs()`.

* Removed unused `dbi_dep()`.



# Version 0.3.1

* Actually export `dbIsValid()` :/

* `dbGetQuery()` uses `dbFetch()` in the default implementation.

# Version 0.3.0

## New and enhanced generics

* `dbIsValid()` returns a logical value describing whether a connection or 
  result set (or other object) is still valid. (#12).

* `dbQuoteString()` and `dbQuoteIdentifier()` to implement database specific
  quoting mechanisms.

* `dbFetch()` added as alias to `fetch()` to provide consistent name. 
  Implementers should define methods for both `fetch()` and `dbFetch()` until 
  `fetch()` is deprecated in 2015. For now, the default method for `dbFetch()` 
  calls `fetch()`.

* `dbBegin()` begins a transaction (#17). If not supported, DB specific
  methods should throw an error (as should `dbCommit()` and `dbRollback()`).

## New default methods

* `dbGetStatement()`, `dbGetRowsAffected()`, `dbHasCompleted()`, and 
  `dbGetRowCount()` gain default methods that extract the appropriate elements
  from `dbGetInfo()`. This means that most drivers should no longer need to
  implement these methods (#13).

* `dbGetQuery()` gains a default method for `DBIConnection` which uses
  `dbSendQuery()`, `fetch()` and `dbClearResult()`.

## Deprecated features

* The following functions are soft-deprecated. They are going away, 
  and developers who use the DBI should begin preparing. The formal deprecation
  process will begin in July 2015, where these function will emit warnings 
  on use.

    * `fetch()` is replaced by `dbFetch()`.

    * `make.db.names()`, `isSQLKeyword()` and `SQLKeywords()`: a black list 
      based approach is fundamentally flawed; instead quote strings and 
      identifiers with `dbQuoteIdentifier()` and `dbQuoteString()`.
  
* `dbGetDBIVersion()` is deprecated since it's now just a thin wrapper
  around `packageVersion("DBI")`.

* `dbSetDataMappings()` (#9) and `dbCallProc()` (#7) are deprecated as no 
  implementations were ever provided.

## Other improvements

* `dbiCheckCompliance()` makes it easier for implementors to check that their
  package is in compliance with the DBI specification.

* All examples now use the RSQLite package so that you can easily try out
  the code samples (#4).

* `dbDriver()` gains a more effective search mechanism that doesn't rely on
  packages being loaded (#1).

* DBI has been converted to use roxygen2 for documentation, and now most
  functions have their own documentation files. I would love your feedback
  on how we could make the documentation better!

# Version 0.2-7

* Trivial changes (updated package fields, daj)

# Version 0.2-6

* Removed deprecated \synopsis in some Rd files (thanks to Prof. Ripley)

# Version 0.2-5

* Code cleanups contributed by Matthias Burger: avoid partial argument
  name matching and use TRUE/FALSE, not T/F.

* Change behavior of make.db.names.default to quote SQL keywords if
  allow.keywords is FALSE.  Previously, SQL keywords would be name
  mangled with underscores and a digit.  Now they are quoted using
  '"'.

# Version 0.2-4

* Changed license from GPL to LPGL

* Fixed a trivial typo in documentation

# Version 0.1-10

* Fixed documentation typos.

# Version 0.1-9

* Trivial changes.

# Version 0.1-8

* A trivial change due to package.description() being deprecated in 1.9.0.

# Version 0.1-7

* Had to do a substantial re-formatting of the documentation
  due to incompatibilities introduced in 1.8.0 S4 method
  documentation. The contents were not changed (modulo fixing 
  a few typos).  Thanks to Kurt Hornik and John Chambers for
  their help.

# Version 0.1-6

* Trivial documentation changes (for R CMD check's sake)

# Version 0.1-5

* Removed duplicated setGeneric("dbSetDataMappings") 

# Version 0.1-4

* Removed the "valueClass" from some generic functions, namely,
  dbListConnections, dbListResults, dbGetException, dbGetQuery,
  and dbGetInfo.  The reason is that methods for these generics
  could potentially return different classes of objects (e.g., 
  the call dbGetInfo(res) could return a list of name-value pairs,
  while dbGetInfo(res, "statement") could be a character vector).

* Added 00Index to inst/doc

* Added dbGetDBIVersion() (simple wrapper to package.description).

# Version 0.1-3

* ??? Minor changes?

# Version 0.1-2

* An implementation based on version 4 classes and methods.
* Incorporated (mostly Tim Keitt's) comments.

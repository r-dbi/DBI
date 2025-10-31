# Make R identifiers into legal SQL identifiers

These methods are DEPRECATED. Please use
[`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md)
(or possibly
[`dbQuoteString()`](https://dbi.r-dbi.org/dev/reference/dbQuoteString.md))
instead.

## Usage

``` r
make.db.names.default(
  snames,
  keywords = .SQL92Keywords,
  unique = TRUE,
  allow.keywords = TRUE
)

isSQLKeyword.default(
  name,
  keywords = .SQL92Keywords,
  case = c("lower", "upper", "any")[3]
)

isSQLKeyword(
  dbObj,
  name,
  keywords = .SQL92Keywords,
  case = c("lower", "upper", "any")[3],
  ...
)

make.db.names(
  dbObj,
  snames,
  keywords = .SQL92Keywords,
  unique = TRUE,
  allow.keywords = TRUE,
  ...
)
```

## Arguments

- snames:

  a character vector of R identifiers (symbols) from which we need to
  make SQL identifiers.

- keywords:

  a character vector with SQL keywords, by default it's `.SQL92Keywords`
  defined by the DBI.

- unique:

  logical describing whether the resulting set of SQL names should be
  unique. Its default is `TRUE`. Following the SQL 92 standard,
  uniqueness of SQL identifiers is determined regardless of whether
  letters are upper or lower case.

- allow.keywords:

  logical describing whether SQL keywords should be allowed in the
  resulting set of SQL names. Its default is `TRUE`

- name:

  a character vector with database identifier candidates we need to
  determine whether they are legal SQL identifiers or not.

- case:

  a character string specifying whether to make the comparison as lower
  case, upper case, or any of the two. it defaults to `any`.

- dbObj:

  any DBI object (e.g., `DBIDriver`).

- ...:

  any other argument are passed to the driver implementation.

## Value

`make.db.names` returns a character vector of legal SQL identifiers
corresponding to its `snames` argument.

`SQLKeywords` returns a character vector of all known keywords for the
database-engine associated with `dbObj`.

`isSQLKeyword` returns a logical vector parallel to `name`.

## Details

The algorithm in `make.db.names` first invokes `make.names` and then
replaces each occurrence of a dot `.` by an underscore `_`. If
`allow.keywords` is `FALSE` and identifiers collide with SQL keywords, a
small integer is appended to the identifier in the form of `"_n"`.

The set of SQL keywords is stored in the character vector
`.SQL92Keywords` and reflects the SQL ANSI/ISO standard as documented in
"X/Open SQL and RDA", 1994, ISBN 1-872630-68-8. Users can easily
override or update this vector.

## Bugs

The current mapping is not guaranteed to be fully reversible: some SQL
identifiers that get mapped into R identifiers with `make.names` and
then back to SQL with `make.db.names()` will not be equal to the
original SQL identifiers (e.g., compound SQL identifiers of the form
`username.tablename` will loose the dot “.”).

## References

The set of SQL keywords is stored in the character vector
`.SQL92Keywords` and reflects the SQL ANSI/ISO standard as documented in
"X/Open SQL and RDA", 1994, ISBN 1-872630-68-8. Users can easily
override or update this vector.

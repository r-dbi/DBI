# Parse interpolated variables from SQL.

If you're implementing a backend that uses non-ANSI quoting or
commenting rules, you'll need to implement a method for
`sqlParseVariables` that calls `sqlParseVariablesImpl` with the
appropriate quote and comment specifications.

## Usage

``` r
sqlCommentSpec(start, end, endRequired)

sqlQuoteSpec(start, end, escape = "", doubleEscape = TRUE)

sqlParseVariablesImpl(sql, quotes, comments)

sqlParseVariables(conn, sql, ...)
```

## Arguments

- start, end:

  Start and end characters for quotes and comments

- endRequired:

  Is the ending character of a comment required?

- escape:

  What character can be used to escape quoting characters? Defaults to
  `""`, i.e. nothing.

- doubleEscape:

  Can quoting characters be escaped by doubling them? Defaults to
  `TRUE`.

- sql:

  SQL to parse (a character string)

- quotes:

  A list of `QuoteSpec` calls defining the quoting specification.

- comments:

  A list of `CommentSpec` calls defining the commenting specification.

## Examples

``` r
# Use [] for quoting and no comments
sqlParseVariablesImpl("[?a]",
  list(sqlQuoteSpec("[", "]", "\\", FALSE)),
  list()
)
#> $start
#> integer(0)
#> 
#> $end
#> integer(0)
#> 

# Standard quotes, use # for commenting
sqlParseVariablesImpl("# ?a\n?b",
  list(sqlQuoteSpec("'", "'"), sqlQuoteSpec('"', '"')),
  list(sqlCommentSpec("#", "\n", FALSE))
)
#> $start
#> [1] 6
#> 
#> $end
#> [1] 7
#> 
```

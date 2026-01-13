# Advanced DBI Usage

## Who this tutorial is for

This tutorial is for you if you need to use a richer set of SQL features
such as data manipulation queries, parameterized queries and queries
performed using SQL’s transaction features. See
[`vignette("DBI", package = "DBI")`](https://dbi.r-dbi.org/dev/articles/DBI.md)
for a more basic tutorial covering connecting to DBMS and executing
simple queries.

## How to run more complex queries using DBI

[`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md)
works by calling a number of functions behind the scenes. If you need
more control you can manually build your own query, retrieve results at
your selected rate, and release the resources involved by calling the
same functions.

These functions are:

- [`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md)
  sends the SQL query to the DBMS and returns a `result` object. The
  query is limited to `SELECT` statements. If you want to send other
  statements, such as `INSERT`, `UPDATE`, `DELETE`, etc, use
  [`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md).
- [`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md) is
  called with the `result` object returned by
  [`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md).
  It also accepts an argument specifying the number of rows to be
  returned, e.g. `n = 200`. If you want to fetch all the rows, use
  `n = -1`.
- [`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
  is called when you have finished retrieving data. It releases the
  resources associated with the `result` object.

``` r
library(DBI)

con <- dbConnect(
  RMariaDB::MariaDB(),
  host = "relational.fel.cvut.cz",
  port = 3306,
  username = "guest",
  password = "ctu-relational",
  dbname = "sakila"
)

res <- dbSendQuery(con, "SELECT * FROM film WHERE rating = 'G'")
df <- dbFetch(res, n = 3)
dbClearResult(res)

head(df, 3)
```

    ##   film_id            title
    ## 1       2   ACE GOLDFINGER
    ## 2       4 AFFAIR PREJUDICE
    ## 3       5      AFRICAN EGG
    ##                                                                                                             description
    ## 1                  A Astounding Epistle of a Database Administrator And a Explorer who must Find a Car in Ancient China
    ## 2                          A Fanciful Documentary of a Frisbee And a Lumberjack who must Chase a Monkey in A Shark Tank
    ## 3 A Fast-Paced Documentary of a Pastry Chef And a Dentist who must Pursue a Forensic Psychologist in The Gulf of Mexico
    ##   release_year language_id original_language_id rental_duration rental_rate
    ## 1         2006           1                   NA               3        4.99
    ## 2         2006           1                   NA               5        2.99
    ## 3         2006           1                   NA               6        2.99
    ##   length replacement_cost rating               special_features
    ## 1     48            12.99      G        Trailers,Deleted Scenes
    ## 2    117            26.99      G Commentaries,Behind the Scenes
    ## 3    130            22.99      G                 Deleted Scenes
    ##           last_update
    ## 1 2006-02-15 04:03:42
    ## 2 2006-02-15 04:03:42
    ## 3 2006-02-15 04:03:42

## How to read part of a table from a database

If your dataset is large you may want to fetch a limited number of rows
at a time. As demonstrated below, this can be accomplished by using a
while loop where the function
[`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md)
is used to check for ongoing rows, and
[`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md) is used
with the `n = X` argument, specifying how many rows to return on each
iteration. Again, we call
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
at the end to release resources.

``` r
res <- dbSendQuery(con, "SELECT * FROM film")
while (!dbHasCompleted(res)) {
  chunk <- dbFetch(res, n = 300)
  print(nrow(chunk))
}
```

    ## [1] 300
    ## [1] 300
    ## [1] 300
    ## [1] 100

``` r
dbClearResult(res)
```

## How to use parameters (safely) in SQL queries

[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md)
can be used with parameterized SQL queries. DBI supports two ways to
avoid SQL injection attacks from user-supplied parameters: quoting and
parameterized queries.

### Quoting

Quoting of parameter values is performed using the function
[`dbQuoteLiteral()`](https://dbi.r-dbi.org/dev/reference/dbQuoteLiteral.md),
which supports many R data types, including date and time.[¹](#fn1)

In cases where users may be supplying table or column names to use in
the query for data retrieval, those names or identifiers must also be
escaped. As there may be DBMS-specific rules for escaping these
identifiers, DBI provides the function
[`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md)
to generate a safe string representation.

``` r
safe_id <- dbQuoteIdentifier(con, "rating")
safe_param <- dbQuoteLiteral(con, "G")

query <- paste0("SELECT title, ", safe_id, " FROM film WHERE ", safe_id, " = ", safe_param)
query
```

    ## [1] "SELECT title, `rating` FROM film WHERE `rating` = 'G'"

``` r
res <- dbSendQuery(con, query)
dbFetch(res)
```

    ##              title rating
    ## 1   ACE GOLDFINGER      G
    ## 2 AFFAIR PREJUDICE      G
    ## 3      AFRICAN EGG      G
    ## Showing 3 out of 178 rows.

``` r
dbClearResult(res)
```

The same result can be had by using
[`glue::glue_sql()`](https://glue.tidyverse.org/reference/glue_sql.html).
It performs the same safe quoting on any variable or R statement
appearing between braces within the query string.

``` r
id <- "rating"
param <- "G"
query <- glue::glue_sql("SELECT title, {`id`} FROM film WHERE {`id`} = {param}", .con = con)

df <- dbGetQuery(con, query)
head(df, 3)
```

    ##              title rating
    ## 1   ACE GOLDFINGER      G
    ## 2 AFFAIR PREJUDICE      G
    ## 3      AFRICAN EGG      G

### Parameterized queries

Rather than performing the parameter substitution ourselves, we can push
it to the DBMS by including placeholders in the query. Different DBMS
use different placeholder schemes, DBI passes through the SQL expression
unchanged.

MariaDB uses a question mark (?) as placeholder and expects an unnamed
list of parameter values. Other DBMS may use named parameters. We
recommend consulting the documentation for the DBMS you are using. As an
example, a web search for “mariadb parameterized queries” leads to the
documentation for the [`PREPARE`
statement](https://mariadb.com/kb/en/prepare-statement/) which mentions:

> Within the statement, “?” characters can be used as parameter markers
> to indicate where data values are to be bound to the query later when
> you execute it.

Currently there is no list of which placeholder scheme a particular DBMS
supports.

Placeholders only work for literal values. Other parts of the query,
e.g. table or column identifiers, still need to be quoted with
[`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md).

For a single set of parameters, the `params` argument to
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md) or
[`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md) can
be used. It takes a list and its members are substituted in order for
the placeholders within the query.

``` r
params <- list("G")
safe_id <- dbQuoteIdentifier(con, "rating")

query <- paste0("SELECT * FROM film WHERE ", safe_id, " = ?")
query
```

    ## [1] "SELECT * FROM film WHERE `rating` = ?"

``` r
res <- dbSendQuery(con, query, params = params)
dbFetch(res, n = 3)
```

    ##   film_id            title
    ## 1       2   ACE GOLDFINGER
    ## 2       4 AFFAIR PREJUDICE
    ## 3       5      AFRICAN EGG
    ##                                                                                                             description
    ## 1                  A Astounding Epistle of a Database Administrator And a Explorer who must Find a Car in Ancient China
    ## 2                          A Fanciful Documentary of a Frisbee And a Lumberjack who must Chase a Monkey in A Shark Tank
    ## 3 A Fast-Paced Documentary of a Pastry Chef And a Dentist who must Pursue a Forensic Psychologist in The Gulf of Mexico
    ##   release_year language_id original_language_id rental_duration rental_rate
    ## 1         2006           1                   NA               3        4.99
    ## 2         2006           1                   NA               5        2.99
    ## 3         2006           1                   NA               6        2.99
    ##   length replacement_cost rating               special_features
    ## 1     48            12.99      G        Trailers,Deleted Scenes
    ## 2    117            26.99      G Commentaries,Behind the Scenes
    ## 3    130            22.99      G                 Deleted Scenes
    ##           last_update
    ## 1 2006-02-15 04:03:42
    ## 2 2006-02-15 04:03:42
    ## 3 2006-02-15 04:03:42

``` r
dbClearResult(res)
```

Below is an example query using multiple placeholders with the MariaDB
driver. The placeholders are supplied as a list of values ordered to
match the position of the placeholders in the query.

``` r
q_params <- list("G", 90)
query <- "SELECT title, rating, length FROM film WHERE rating = ? AND length >= ?"

res <- dbSendQuery(con, query, params = q_params)
dbFetch(res, n = 3)
```

    ##              title rating length
    ## 1 AFFAIR PREJUDICE      G    117
    ## 2      AFRICAN EGG      G    130
    ## 3  ALAMO VIDEOTAPE      G    126

``` r
dbClearResult(res)
```

When you wish to perform the same query with different sets of parameter
values, [`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) is
used. There are two ways to use
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md). Firstly, it
can be used multiple times with same query.

``` r
res <- dbSendQuery(con, "SELECT * FROM film WHERE rating = ?")
dbBind(res, list("G"))
dbFetch(res, n = 3)
```

    ##   film_id            title
    ## 1       2   ACE GOLDFINGER
    ## 2       4 AFFAIR PREJUDICE
    ## 3       5      AFRICAN EGG
    ##                                                                                                             description
    ## 1                  A Astounding Epistle of a Database Administrator And a Explorer who must Find a Car in Ancient China
    ## 2                          A Fanciful Documentary of a Frisbee And a Lumberjack who must Chase a Monkey in A Shark Tank
    ## 3 A Fast-Paced Documentary of a Pastry Chef And a Dentist who must Pursue a Forensic Psychologist in The Gulf of Mexico
    ##   release_year language_id original_language_id rental_duration rental_rate
    ## 1         2006           1                   NA               3        4.99
    ## 2         2006           1                   NA               5        2.99
    ## 3         2006           1                   NA               6        2.99
    ##   length replacement_cost rating               special_features
    ## 1     48            12.99      G        Trailers,Deleted Scenes
    ## 2    117            26.99      G Commentaries,Behind the Scenes
    ## 3    130            22.99      G                 Deleted Scenes
    ##           last_update
    ## 1 2006-02-15 04:03:42
    ## 2 2006-02-15 04:03:42
    ## 3 2006-02-15 04:03:42

``` r
dbBind(res, list("PG"))
dbFetch(res, n = 3)
```

    ##   film_id            title
    ## 1       1 ACADEMY DINOSAUR
    ## 2       6     AGENT TRUMAN
    ## 3      12   ALASKA PHANTOM
    ##                                                                                        description
    ## 1 A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies
    ## 2        A Intrepid Panorama of a Robot And a Boy who must Escape a Sumo Wrestler in Ancient China
    ## 3               A Fanciful Saga of a Hunter And a Pastry Chef who must Vanquish a Boy in Australia
    ##   release_year language_id original_language_id rental_duration rental_rate
    ## 1         2006           1                   NA               6        0.99
    ## 2         2006           1                   NA               3        2.99
    ## 3         2006           1                   NA               6        0.99
    ##   length replacement_cost rating                 special_features
    ## 1     86            20.99     PG Deleted Scenes,Behind the Scenes
    ## 2    169            17.99     PG                   Deleted Scenes
    ## 3    136            22.99     PG      Commentaries,Deleted Scenes
    ##           last_update
    ## 1 2006-02-15 04:03:42
    ## 2 2006-02-15 04:03:42
    ## 3 2006-02-15 04:03:42

``` r
dbClearResult(res)
```

Secondly, [`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md)
can be used to execute the same statement with multiple values at once.

``` r
res <- dbSendQuery(con, "SELECT * FROM film WHERE rating = ?")
dbBind(res, list(c("G", "PG")))
dbFetch(res, n = 3)
```

    ##   film_id            title
    ## 1       2   ACE GOLDFINGER
    ## 2       4 AFFAIR PREJUDICE
    ## 3       5      AFRICAN EGG
    ##                                                                                                             description
    ## 1                  A Astounding Epistle of a Database Administrator And a Explorer who must Find a Car in Ancient China
    ## 2                          A Fanciful Documentary of a Frisbee And a Lumberjack who must Chase a Monkey in A Shark Tank
    ## 3 A Fast-Paced Documentary of a Pastry Chef And a Dentist who must Pursue a Forensic Psychologist in The Gulf of Mexico
    ##   release_year language_id original_language_id rental_duration rental_rate
    ## 1         2006           1                   NA               3        4.99
    ## 2         2006           1                   NA               5        2.99
    ## 3         2006           1                   NA               6        2.99
    ##   length replacement_cost rating               special_features
    ## 1     48            12.99      G        Trailers,Deleted Scenes
    ## 2    117            26.99      G Commentaries,Behind the Scenes
    ## 3    130            22.99      G                 Deleted Scenes
    ##           last_update
    ## 1 2006-02-15 04:03:42
    ## 2 2006-02-15 04:03:42
    ## 3 2006-02-15 04:03:42

``` r
dbClearResult(res)
```

Use a list of vectors if your query has multiple parameters:

``` r
q_params <- list(c("G", "PG"), c(90, 120))
query <- "SELECT title, rating, length FROM film WHERE rating = ? AND length >= ?"

res <- dbSendQuery(con, query, params = q_params)
dbFetch(res, n = 3)
```

    ##              title rating length
    ## 1 AFFAIR PREJUDICE      G    117
    ## 2      AFRICAN EGG      G    130
    ## 3  ALAMO VIDEOTAPE      G    126

``` r
dbClearResult(res)
```

Always disconnect from the database when done.

``` r
dbDisconnect(con)
```

## SQL data manipulation - UPDATE, DELETE and friends

For SQL queries that affect the underlying database, such as UPDATE,
DELETE, INSERT INTO, and DROP TABLE, DBI provides two functions.
[`dbExecute()`](https://dbi.r-dbi.org/dev/reference/dbExecute.md) passes
the SQL statement to the DBMS for execution and returns the number of
rows affected.
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md)
performs in the same manner, but returns a result object. Call
[`dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md)
with the result object to get the count of the affected rows. You then
need to call
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
with the result object afterwards to release resources.

In actuality,
[`dbExecute()`](https://dbi.r-dbi.org/dev/reference/dbExecute.md) is a
convenience function that calls
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md),
[`dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md),
and
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md).
You can use these functions if you need more control over the query
process.

The subsequent examples use an in-memory SQL database provided by
[`RSQLite::SQLite()`](https://rsqlite.r-dbi.org/reference/SQLite.html),
because the remote database used in above examples does not allow
writing.

``` r
library(DBI)
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "cars", head(cars, 3))

dbExecute(
  con,
  "INSERT INTO cars (speed, dist) VALUES (1, 1), (2, 2), (3, 3)"
)
```

    ## [1] 3

``` r
rs <- dbSendStatement(
  con,
  "INSERT INTO cars (speed, dist) VALUES (4, 4), (5, 5), (6, 6)"
)
dbGetRowsAffected(rs)
```

    ## [1] 3

``` r
dbClearResult(rs)

dbReadTable(con, "cars")
```

    ##   speed dist
    ## 1     4    2
    ## 2     4   10
    ## 3     7    4
    ## Showing 3 out of 9 rows.

Do not forget to disconnect from the database at the end.

``` r
dbDisconnect(con)
```

## SQL transactions with DBI

DBI allows you to group multiple queries into a single atomic
transaction. Transactions are initiated with
[`dbBegin()`](https://dbi.r-dbi.org/dev/reference/transactions.md) and
either made persistent with
[`dbCommit()`](https://dbi.r-dbi.org/dev/reference/transactions.md) or
undone with
[`dbRollback()`](https://dbi.r-dbi.org/dev/reference/transactions.md).
The example below updates two tables and ensures that either both tables
are updated, or no changes are persisted to the database and an error is
thrown.

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "cash", data.frame(amount = 100))
dbWriteTable(con, "account", data.frame(amount = 2000))

withdraw <- function(amount) {
  # All operations must be carried out as logical unit:
  dbExecute(con, "UPDATE cash SET amount = amount + ?", list(amount))
  dbExecute(con, "UPDATE account SET amount = amount - ?", list(amount))
}

withdraw_transacted <- function(amount) {
  # Ensure atomicity
  dbBegin(con)

  # Perform operation
  withdraw(amount)

  # Persist results
  dbCommit(con)
}

withdraw_transacted(300)
```

After withdrawing 300 credits, the cash is increased and the account is
decreased by this amount. The transaction ensures that either both
operations succeed, or no change occurs.

``` r
dbReadTable(con, "cash")
```

    ##   amount
    ## 1    400

``` r
dbReadTable(con, "account")
```

    ##   amount
    ## 1   1700

We can roll back changes manually if necessary. Do not forget to call
[`dbRollback()`](https://dbi.r-dbi.org/dev/reference/transactions.md) in
case of error, otherwise the transaction remains open indefinitely.

``` r
withdraw_if_funds <- function(amount) {
  dbBegin(con)
  withdraw(amount)
  # Rolling back after detecting negative value on account:
  if (dbReadTable(con, "account")$amount >= 0) {
    dbCommit(con)
    TRUE
  } else {
    message("Insufficient funds")
    dbRollback(con)
    FALSE
  }
}

withdraw_if_funds(5000)
```

    ## Insufficient funds

    ## [1] FALSE

``` r
dbReadTable(con, "cash")
```

    ##   amount
    ## 1    400

``` r
dbReadTable(con, "account")
```

    ##   amount
    ## 1   1700

[`dbWithTransaction()`](https://dbi.r-dbi.org/dev/reference/dbWithTransaction.md)
simplifies using transactions. Pass it a connection and the code you
want to run as a transaction. It will execute the code and call
[`dbCommit()`](https://dbi.r-dbi.org/dev/reference/transactions.md) on
success and call
[`dbRollback()`](https://dbi.r-dbi.org/dev/reference/transactions.md) if
an error is thrown.

``` r
withdraw_safely <- function(amount) {
  dbWithTransaction(con, {
    withdraw(amount)
    if (dbReadTable(con, "account")$amount < 0) {
      stop("Error: insufficient funds", call. = FALSE)
    }
  })
}

withdraw_safely(5000)
```

    ## Error:
    ## ! Error: insufficient funds

``` r
dbReadTable(con, "cash")
```

    ##   amount
    ## 1    400

``` r
dbReadTable(con, "account")
```

    ##   amount
    ## 1   1700

As usual, do not forget to disconnect from the database when done.

``` r
dbDisconnect(con)
```

## Conclusion

That concludes the major features of DBI. For more details on the
library functions covered in this tutorial and the
[`vignette("DBI", package = "DBI")`](https://dbi.r-dbi.org/dev/articles/DBI.md)
introductory tutorial see the DBI specification at
[`vignette("spec", package = "DBI")`](https://dbi.r-dbi.org/dev/articles/spec.md).
If you are after a data manipulation library that works at a higher
level of abstraction, check out [dplyr](https://dplyr.tidyverse.org). It
is a grammar of data manipulation that can work with local dataframes
and remote databases and uses DBI under the hood.

------------------------------------------------------------------------

1.  An older method,
    [`dbQuoteString()`](https://dbi.r-dbi.org/dev/reference/dbQuoteString.md),
    was used to quote string values only. The
    [`dbQuoteLiteral()`](https://dbi.r-dbi.org/dev/reference/dbQuoteLiteral.md)
    method forwards to
    [`dbQuoteString()`](https://dbi.r-dbi.org/dev/reference/dbQuoteString.md)
    for character vectors. Users do not need to distinguish between
    these two cases.

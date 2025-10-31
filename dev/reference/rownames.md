# Convert row names back and forth between columns

These functions provide a reasonably automatic way of preserving the row
names of data frame during back-and-forth translation to an SQL table.
By default, row names will be converted to an explicit column called
"row_names", and any query returning a column called "row_names" will
have those automatically set as row names. These methods are mostly
useful for backend implementers.

## Usage

``` r
sqlRownamesToColumn(df, row.names = NA)

sqlColumnToRownames(df, row.names = NA)
```

## Arguments

- df:

  A data frame

- row.names:

  Either `TRUE`, `FALSE`, `NA` or a string.

  If `TRUE`, always translate row names to a column called "row_names".
  If `FALSE`, never translate row names. If `NA`, translate rownames
  only if they're a character vector.

  A string is equivalent to `TRUE`, but allows you to override the
  default name.

  For backward compatibility, `NULL` is equivalent to `FALSE`.

## Examples

``` r
# If have row names
sqlRownamesToColumn(head(mtcars))
#>           row_names  mpg cyl disp  hp drat    wt  qsec vs am gear carb
#> 1         Mazda RX4 21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
#> 2     Mazda RX4 Wag 21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
#> 3        Datsun 710 22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
#> 4    Hornet 4 Drive 21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
#> 5 Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
#> 6           Valiant 18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
sqlRownamesToColumn(head(mtcars), FALSE)
#>    mpg cyl disp  hp drat    wt  qsec vs am gear carb
#> 1 21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
#> 2 21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
#> 3 22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
#> 4 21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
#> 5 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
#> 6 18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
sqlRownamesToColumn(head(mtcars), "ROWNAMES")
#>            ROWNAMES  mpg cyl disp  hp drat    wt  qsec vs am gear carb
#> 1         Mazda RX4 21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
#> 2     Mazda RX4 Wag 21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
#> 3        Datsun 710 22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
#> 4    Hornet 4 Drive 21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
#> 5 Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
#> 6           Valiant 18.1   6  225 105 2.76 3.460 20.22  1  0    3    1

# If don't have
sqlRownamesToColumn(head(iris))
#>   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
#> 1          5.1         3.5          1.4         0.2  setosa
#> 2          4.9         3.0          1.4         0.2  setosa
#> 3          4.7         3.2          1.3         0.2  setosa
#> 4          4.6         3.1          1.5         0.2  setosa
#> 5          5.0         3.6          1.4         0.2  setosa
#> 6          5.4         3.9          1.7         0.4  setosa
sqlRownamesToColumn(head(iris), TRUE)
#>   row_names Sepal.Length Sepal.Width Petal.Length Petal.Width Species
#> 1         1          5.1         3.5          1.4         0.2  setosa
#> 2         2          4.9         3.0          1.4         0.2  setosa
#> 3         3          4.7         3.2          1.3         0.2  setosa
#> 4         4          4.6         3.1          1.5         0.2  setosa
#> 5         5          5.0         3.6          1.4         0.2  setosa
#> 6         6          5.4         3.9          1.7         0.4  setosa
sqlRownamesToColumn(head(iris), "ROWNAMES")
#>   ROWNAMES Sepal.Length Sepal.Width Petal.Length Petal.Width Species
#> 1        1          5.1         3.5          1.4         0.2  setosa
#> 2        2          4.9         3.0          1.4         0.2  setosa
#> 3        3          4.7         3.2          1.3         0.2  setosa
#> 4        4          4.6         3.1          1.5         0.2  setosa
#> 5        5          5.0         3.6          1.4         0.2  setosa
#> 6        6          5.4         3.9          1.7         0.4  setosa
```

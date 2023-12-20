# DBItest

<details>

* Version: 1.7.3
* GitHub: https://github.com/r-dbi/DBItest
* Source code: https://github.com/cran/DBItest
* Date/Publication: 2022-10-18 07:25:35 UTC
* Number of recursive dependencies: 116

Run `revdepcheck::cloud_details(, "DBItest")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > # This file is part of the standard setup for testthat.
      > # It is recommended that you do not modify it.
      > #
      > # Where should you do additional test configuration?
      > # Learn more about the roles of various files in:
      > # * https://r-pkgs.org/tests.html
      > # * https://testthat.r-lib.org/reference/test_package.html#special-files
    ...
      [32] "dbRollback"          | "dbRollback"          [39]          
      [33] "dbSendQuery"         | "dbSendQuery"         [40]          
                                 - "dbSendQueryArrow"    [41]          
      [34] "dbSendStatement"     | "dbSendStatement"     [42]          
      [35] "dbUnquoteIdentifier" | "dbUnquoteIdentifier" [43]          
       ... ...                     ...                   and 3 more ...
      
      [ FAIL 1 | WARN 0 | SKIP 1 | PASS 10 ]
      Error: Test failures
      Execution halted
    ```

# dm

<details>

* Version: 1.0.8
* GitHub: https://github.com/cynkra/dm
* Source code: https://github.com/cran/dm
* Date/Publication: 2023-11-02 14:30:02 UTC
* Number of recursive dependencies: 137

Run `revdepcheck::cloud_details(, "dm")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > 
      > # Need to use qualified call, this is checked in helper-print.R
      > testthat::test_check("dm")
      Loading required package: dm
      
      Attaching package: 'dm'
    ...
      • draw-dm/nycflight-dm.svg
      • draw-dm/single-empty-table-dm.svg
      • draw-dm/table-desc-1-dm.svg
      • draw-dm/table-desc-2-dm.svg
      • draw-dm/table-desc-3-dm.svg
      • draw-dm/table-desc-4-dm.svg
      • draw-dm/table-uk-1-dm.svg
      • draw-dm/table-uk-2-dm.svg
      Error: Test failures
      Execution halted
    ```

# glue

<details>

* Version: 1.6.2
* GitHub: https://github.com/tidyverse/glue
* Source code: https://github.com/cran/glue
* Date/Publication: 2022-02-24 07:50:20 UTC
* Number of recursive dependencies: 89

Run `revdepcheck::cloud_details(, "glue")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘glue-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: glue_sql
    > ### Title: Interpolate strings with SQL escaping
    > ### Aliases: glue_sql glue_data_sql
    > 
    > ### ** Examples
    > 
    > ## Don't show: 
    ...
    > query <- glue_sql("\n  SELECT {`cols`*}\n  FROM {`iris_db`}\n  JOIN {`nicknames_db`}\n  ON {`iris_species`}={`nicknames_species`}", 
    +     .con = con)
    > query
    <SQL> SELECT `sepal_length`.`iris`, `sepal_width`.`iris`, `nickname`.`nicknames`
    FROM `iris`
    JOIN `nicknames`
    ON `species`.`iris`=`species`.`nicknames`
    > DBI::dbGetQuery(con, query, n = 5)
    Error: no such column: sepal_length.iris
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(glue)
      > 
      > test_check("glue")
      Loading required package: crayon
      [ FAIL 2 | WARN 0 | SKIP 4 | PASS 260 ]
      
    ...
      
      `actual@.Data`:   "`foo`.`baz`.`bar`, `foo`.`baz2`.`bar`"
      `expected@.Data`: "`foo`.`bar`.`baz`, `foo`.`bar`.`baz2`"
      
      `actual`:   "`foo`.`baz`.`bar`, `foo`.`baz2`.`bar`"
      `expected`: "`foo`.`bar`.`baz`, `foo`.`bar`.`baz2`"
      
      [ FAIL 2 | WARN 0 | SKIP 4 | PASS 260 ]
      Error: Test failures
      Execution halted
    ```

# pool

<details>

* Version: 1.0.1
* GitHub: https://github.com/rstudio/pool
* Source code: https://github.com/cran/pool
* Date/Publication: 2023-02-21 15:20:02 UTC
* Number of recursive dependencies: 81

Run `revdepcheck::cloud_details(, "pool")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > # This file is part of the standard setup for testthat.
      > # It is recommended that you do not modify it.
      > #
      > # Where should you do additional test configuration?
      > # Learn more about the roles of various files in:
      > # * https://r-pkgs.org/tests.html
      > # * https://testthat.r-lib.org/reference/test_package.html#special-files
    ...
      [1] "dbAppendTableArrow" -          
      [2] "dbCreateTableArrow" -          
      [3] "dbGetQueryArrow"    -          
      [4] "dbReadTableArrow"   -          
      [5] "dbSendQueryArrow"   -          
      [6] "dbWriteTableArrow"  -          
      
      [ FAIL 1 | WARN 0 | SKIP 19 | PASS 47 ]
      Error: Test failures
      Execution halted
    ```


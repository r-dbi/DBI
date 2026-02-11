# Package index

## Connecting and disconnecting

Connecting to and disconnecting from databases.

- [`dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.md) : Create
  a connection to a DBMS
- [`dbDisconnect()`](https://dbi.r-dbi.org/reference/dbDisconnect.md) :
  Disconnect (close) a connection
- [`dbCanConnect()`](https://dbi.r-dbi.org/reference/dbCanConnect.md) :
  Check if a connection to a DBMS can be established
- [`dbGetInfo()`](https://dbi.r-dbi.org/reference/dbGetInfo.md) : Get
  DBMS metadata
- [`dbIsValid()`](https://dbi.r-dbi.org/reference/dbIsValid.md) : Is
  this DBMS object still valid?
- [`dbIsReadOnly()`](https://dbi.r-dbi.org/reference/dbIsReadOnly.md) :
  Is this DBMS object read only?
- [`DBIConnector-class`](https://dbi.r-dbi.org/reference/DBIConnector-class.md)
  : DBIConnector class
- [`dbGetConnectArgs()`](https://dbi.r-dbi.org/reference/dbGetConnectArgs.md)
  : Get connection arguments

## Tables

Reading and writing entire tables.

- [`dbReadTable()`](https://dbi.r-dbi.org/reference/dbReadTable.md) :
  Read database tables as data frames
- [`dbWriteTable()`](https://dbi.r-dbi.org/reference/dbWriteTable.md) :
  Copy data frames to database tables
- [`dbCreateTable()`](https://dbi.r-dbi.org/reference/dbCreateTable.md)
  : Create a table in the database
- [`dbAppendTable()`](https://dbi.r-dbi.org/reference/dbAppendTable.md)
  : Insert rows into a table
- [`dbRemoveTable()`](https://dbi.r-dbi.org/reference/dbRemoveTable.md)
  : Remove a table from the database
- [`dbListTables()`](https://dbi.r-dbi.org/reference/dbListTables.md) :
  List remote tables
- [`dbListFields()`](https://dbi.r-dbi.org/reference/dbListFields.md) :
  List field names of a remote table
- [`dbExistsTable()`](https://dbi.r-dbi.org/reference/dbExistsTable.md)
  : Does a table exist?
- [`dbListObjects()`](https://dbi.r-dbi.org/reference/dbListObjects.md)
  : List remote objects
- [`sqlRownamesToColumn()`](https://dbi.r-dbi.org/reference/rownames.md)
  [`sqlColumnToRownames()`](https://dbi.r-dbi.org/reference/rownames.md)
  : Convert row names back and forth between columns

## Queries and statements

Communicate with the DBMS.

- [`dbGetQuery()`](https://dbi.r-dbi.org/reference/dbGetQuery.md) :
  Retrieve results from a query
- [`dbExecute()`](https://dbi.r-dbi.org/reference/dbExecute.md) : Change
  database state

## Results

More control for sending queries and executing statements.

- [`dbSendQuery()`](https://dbi.r-dbi.org/reference/dbSendQuery.md) :
  Execute a query on a given database connection
- [`dbSendStatement()`](https://dbi.r-dbi.org/reference/dbSendStatement.md)
  : Execute a data manipulation statement on a given database connection
- [`dbBind()`](https://dbi.r-dbi.org/reference/dbBind.md)
  [`dbBindArrow()`](https://dbi.r-dbi.org/reference/dbBind.md)
  **\[experimental\]** : Bind values to a parameterized/prepared
  statement
- [`dbFetch()`](https://dbi.r-dbi.org/reference/dbFetch.md)
  [`fetch()`](https://dbi.r-dbi.org/reference/dbFetch.md) : Fetch
  records from a previously executed query
- [`dbGetRowCount()`](https://dbi.r-dbi.org/reference/dbGetRowCount.md)
  : The number of rows fetched so far
- [`dbGetRowsAffected()`](https://dbi.r-dbi.org/reference/dbGetRowsAffected.md)
  : The number of rows affected
- [`dbGetStatement()`](https://dbi.r-dbi.org/reference/dbGetStatement.md)
  : Get the statement associated with a result set
- [`dbHasCompleted()`](https://dbi.r-dbi.org/reference/dbHasCompleted.md)
  : Completion status
- [`dbColumnInfo()`](https://dbi.r-dbi.org/reference/dbColumnInfo.md) :
  Information about result types
- [`dbClearResult()`](https://dbi.r-dbi.org/reference/dbClearResult.md)
  : Clear a result set

## Transactions

Ensuring multiple statements are executed together, or not at all.

- [`dbBegin()`](https://dbi.r-dbi.org/reference/transactions.md)
  [`dbCommit()`](https://dbi.r-dbi.org/reference/transactions.md)
  [`dbRollback()`](https://dbi.r-dbi.org/reference/transactions.md) :
  Begin/commit/rollback SQL transactions
- [`dbWithTransaction()`](https://dbi.r-dbi.org/reference/dbWithTransaction.md)
  [`dbBreak()`](https://dbi.r-dbi.org/reference/dbWithTransaction.md) :
  Self-contained SQL transactions

## SQL

Tools for creating and parsing SQL queries.

- [`SQL()`](https://dbi.r-dbi.org/reference/SQL.md) : SQL quoting
- [`dbDataType()`](https://dbi.r-dbi.org/reference/dbDataType.md) :
  Determine the SQL data type of an object
- [`dbQuoteIdentifier()`](https://dbi.r-dbi.org/reference/dbQuoteIdentifier.md)
  : Quote identifiers
- [`dbQuoteLiteral()`](https://dbi.r-dbi.org/reference/dbQuoteLiteral.md)
  : Quote literal values
- [`dbQuoteString()`](https://dbi.r-dbi.org/reference/dbQuoteString.md)
  : Quote literal strings
- [`sqlCreateTable()`](https://dbi.r-dbi.org/reference/sqlCreateTable.md)
  : Compose query to create a simple table
- [`sqlAppendTable()`](https://dbi.r-dbi.org/reference/sqlAppendTable.md)
  [`sqlAppendTableTemplate()`](https://dbi.r-dbi.org/reference/sqlAppendTable.md)
  : Compose query to insert rows into a table
- [`sqlData()`](https://dbi.r-dbi.org/reference/sqlData.md) : Convert a
  data frame into form suitable for upload to an SQL database
- [`dbUnquoteIdentifier()`](https://dbi.r-dbi.org/reference/dbUnquoteIdentifier.md)
  : Unquote identifiers
- [`sqlInterpolate()`](https://dbi.r-dbi.org/reference/sqlInterpolate.md)
  : Safely interpolate values into an SQL string

## Arrow

**experimental lifecycle**

Returning and sending data in the Arrow format.

- [`dbReadTableArrow()`](https://dbi.r-dbi.org/reference/dbReadTableArrow.md)
  **\[experimental\]** : Read database tables as Arrow objects
- [`dbWriteTableArrow()`](https://dbi.r-dbi.org/reference/dbWriteTableArrow.md)
  **\[experimental\]** : Copy Arrow objects to database tables
- [`dbCreateTableArrow()`](https://dbi.r-dbi.org/reference/dbCreateTableArrow.md)
  **\[experimental\]** : Create a table in the database based on an
  Arrow object
- [`dbAppendTableArrow()`](https://dbi.r-dbi.org/reference/dbAppendTableArrow.md)
  **\[experimental\]** : Insert rows into a table from an Arrow stream
- [`dbGetQueryArrow()`](https://dbi.r-dbi.org/reference/dbGetQueryArrow.md)
  **\[experimental\]** : Retrieve results from a query as an Arrow
  object
- [`dbSendQueryArrow()`](https://dbi.r-dbi.org/reference/dbSendQueryArrow.md)
  **\[experimental\]** : Execute a query on a given database connection
  for retrieval via Arrow
- [`dbBind()`](https://dbi.r-dbi.org/reference/dbBind.md)
  [`dbBindArrow()`](https://dbi.r-dbi.org/reference/dbBind.md)
  **\[experimental\]** : Bind values to a parameterized/prepared
  statement
- [`dbFetchArrow()`](https://dbi.r-dbi.org/reference/dbFetchArrow.md)
  **\[experimental\]** : Fetch records from a previously executed query
  as an Arrow object
- [`dbFetchArrowChunk()`](https://dbi.r-dbi.org/reference/dbFetchArrowChunk.md)
  **\[experimental\]** : Fetch the next batch of records from a
  previously executed query as an Arrow object

## Classes

S4 classes defined by DBI.

- [`DBI`](https://dbi.r-dbi.org/reference/DBI-package.md)
  [`DBI-package`](https://dbi.r-dbi.org/reference/DBI-package.md) : DBI:
  R Database Interface
- [`DBIObject-class`](https://dbi.r-dbi.org/reference/DBIObject-class.md)
  : DBIObject class
- [`DBIDriver-class`](https://dbi.r-dbi.org/reference/DBIDriver-class.md)
  : DBIDriver class
- [`DBIConnection-class`](https://dbi.r-dbi.org/reference/DBIConnection-class.md)
  : DBIConnection class
- [`DBIResult-class`](https://dbi.r-dbi.org/reference/DBIResult-class.md)
  : DBIResult class
- [`DBIResultArrow-class`](https://dbi.r-dbi.org/reference/DBIResultArrow-class.md)
  [`DBIResultArrowDefault-class`](https://dbi.r-dbi.org/reference/DBIResultArrow-class.md)
  **\[experimental\]** : DBIResultArrow class
- [`DBIConnector-class`](https://dbi.r-dbi.org/reference/DBIConnector-class.md)
  : DBIConnector class
- [`Id()`](https://dbi.r-dbi.org/reference/Id.md) : Refer to a table
  nested in a hierarchy (e.g. within a schema)

## Data

S4 classes defined by DBI.

- [`.SQL92Keywords`](https://dbi.r-dbi.org/reference/dot-SQL92Keywords.md)
  : Keywords according to the SQL-92 standard

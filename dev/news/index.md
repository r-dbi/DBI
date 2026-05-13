# Changelog

## DBI 1.3.0.9007 (2026-05-06)

### Continuous integration

- Cosmetics.

- Bump action versions.

- Install clang-format-21.

- Align fledge workflow.

- Harmonize.

## DBI 1.3.0.9006 (2026-05-04)

### Chore

- Auto-update from GitHub Actions
  ([\#670](https://github.com/r-dbi/DBI/issues/670)).

## DBI 1.3.0.9005 (2026-04-25)

### Chore

- Auto-update from GitHub Actions
  ([\#668](https://github.com/r-dbi/DBI/issues/668)).

- Auto-update from GitHub Actions
  ([\#667](https://github.com/r-dbi/DBI/issues/667)).

## DBI 1.3.0.9004 (2026-04-24)

### Chore

- Auto-update from GitHub Actions
  ([\#580](https://github.com/r-dbi/DBI/issues/580)).

- Auto-update from GitHub Actions
  ([\#579](https://github.com/r-dbi/DBI/issues/579)).

## DBI 1.3.0.9003 (2026-03-12)

### Chore

- Auto-update from GitHub Actions
  ([\#577](https://github.com/r-dbi/DBI/issues/577)).

## DBI 1.3.0.9002 (2026-03-08)

### Chore

- Auto-update from GitHub Actions
  ([\#575](https://github.com/r-dbi/DBI/issues/575)).

- Auto-update from GitHub Actions
  ([\#574](https://github.com/r-dbi/DBI/issues/574)).

## DBI 1.3.0.9001 (2026-03-07)

### Chore

- Auto-update from GitHub Actions
  ([\#572](https://github.com/r-dbi/DBI/issues/572)).

## DBI 1.3.0.9000 (2026-02-26)

- Switching to development version.

## DBI 1.3.0 (2026-02-11)

### Features

- Add support for OpenTelemetry via the otel and otelsdk packages
  ([@shikokuchuo](https://github.com/shikokuchuo),
  [\#551](https://github.com/r-dbi/DBI/issues/551)).

### Bug fixes

- [`dbWithTransaction()`](https://dbi.r-dbi.org/dev/reference/dbWithTransaction.md)
  calls
  [`dbRollback()`](https://dbi.r-dbi.org/dev/reference/transactions.md)
  also on interrupt ([@klin333](https://github.com/klin333),
  [\#528](https://github.com/r-dbi/DBI/issues/528)).

- [`dbQuoteLiteral()`](https://dbi.r-dbi.org/dev/reference/dbQuoteLiteral.md)
  uses the format `"%Y-%m-%d %H:%M:%S%z"` which is understood by more
  databases ([\#486](https://github.com/r-dbi/DBI/issues/486)).

### Documentation

- Add “Supported By Posit” badge to website
  ([@krlmlr](https://github.com/krlmlr)).

- Render specification with newest pandoc
  ([\#568](https://github.com/r-dbi/DBI/issues/568)).

- Add new generics to specification.

### Performance

- Avoid unnecessary computation in default
  [`dbUnquoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbUnquoteIdentifier.md)
  method ([@MichaelChirico](https://github.com/MichaelChirico),
  [\#515](https://github.com/r-dbi/DBI/issues/515)).

### Breaking changes

- Many generics in the package are now a `"nonstandardGeneric"` instead
  of a `"standardGeneric"`: The `def` argument to
  [`methods::setClass()`](https://rdrr.io/r/methods/setClass.html)
  changed from a direct call to `methods::standardGeneric()` to a
  function that wraps `methods::standardGeneric()`. This should not
  affect most users, but became apparent with the tests in the dittodb
  package failing and is listed here for completeness. See
  <https://github.com/ropensci/dittodb/pull/197> for detail.

## DBI 1.2.3 (2024-06-02)

### Bug fixes

- [`dbQuoteLiteral()`](https://dbi.r-dbi.org/dev/reference/dbQuoteLiteral.md)
  uses the format `"%Y-%m-%d %H-%M-%S%z"` which is understood by more
  databases ([\#467](https://github.com/r-dbi/DBI/issues/467),
  [\#474](https://github.com/r-dbi/DBI/issues/474)).

### Documentation

- Use relational-data.org as a replacement for relational.fit.cvut.cz.
- Set BS version explicitly for now
  ([@maelle](https://github.com/maelle),
  [\#478](https://github.com/r-dbi/DBI/issues/478)).
- Include
  [`dbGetInfo()`](https://dbi.r-dbi.org/dev/reference/dbGetInfo.md) in
  the spec ([\#477](https://github.com/r-dbi/DBI/issues/477)).
- Fix typos ([@salim-b](https://github.com/salim-b),
  [\#469](https://github.com/r-dbi/DBI/issues/469),
  [@MichaelChirico](https://github.com/MichaelChirico),
  [\#482](https://github.com/r-dbi/DBI/issues/482)).

## DBI 1.2.2 (2024-02-09)

### Bug fixes

- [`Id()`](https://dbi.r-dbi.org/dev/reference/Id.md) does not assign
  empty names to the components if all arguments are unnamed
  ([\#464](https://github.com/r-dbi/DBI/issues/464)).
- Add spec to version control to avoid weird pandoc errors on CRAN
  ([\#465](https://github.com/r-dbi/DBI/issues/465)).

## DBI 1.2.1 (2024-01-12)

### Bug fixes

- Fix
  [`dbWriteTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbWriteTableArrow.md)
  according to spec ([\#457](https://github.com/r-dbi/DBI/issues/457)).

- Fix type inference in default method for
  [`dbCreateTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbCreateTableArrow.md)
  ([\#450](https://github.com/r-dbi/DBI/issues/450)).

### Features

- [`dbAppendTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbAppendTableArrow.md)
  returns number of rows
  ([\#454](https://github.com/r-dbi/DBI/issues/454)).

- Add `temporary` argument to
  [`dbCreateTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbCreateTableArrow.md)
  ([\#453](https://github.com/r-dbi/DBI/issues/453)).

- Avoid coercing `params` in default implementation for
  [`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md)
  ([\#447](https://github.com/r-dbi/DBI/issues/447)).

- Use
  [`nanoarrow::infer_nanoarrow_schema()`](https://arrow.apache.org/nanoarrow/latest/r/reference/as_nanoarrow_schema.html)
  in the default method for
  [`dbCreateTable()`](https://dbi.r-dbi.org/dev/reference/dbCreateTable.md)
  ([\#445](https://github.com/r-dbi/DBI/issues/445)).

### Chore

- Add badge to `DBIResultArrow` class
  ([\#452](https://github.com/r-dbi/DBI/issues/452)).

- Change maintainer e-mail.

### Documentation

- Finalize Arrow vignette
  ([\#451](https://github.com/r-dbi/DBI/issues/451),
  [\#455](https://github.com/r-dbi/DBI/issues/455)).

- Document new Arrow generics
  ([\#444](https://github.com/r-dbi/DBI/issues/444),
  [\#449](https://github.com/r-dbi/DBI/issues/449)).

- Use dbitemplate ([@maelle](https://github.com/maelle),
  [\#442](https://github.com/r-dbi/DBI/issues/442)).

## DBI 1.2.0 (2023-12-20)

### Breaking changes

- [`dbUnquoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbUnquoteIdentifier.md)
  creates [`Id()`](https://dbi.r-dbi.org/dev/reference/Id.md) objects
  without component names and allows non-`NA` character input
  ([\#421](https://github.com/r-dbi/DBI/issues/421),
  [\#422](https://github.com/r-dbi/DBI/issues/422)).

### Features

- New generics
  [`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md),
  [`dbFetchArrow()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrow.md),
  [`dbGetQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbGetQueryArrow.md),
  [`dbReadTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbReadTableArrow.md),
  [`dbWriteTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbWriteTableArrow.md)
  ([@nbenn](https://github.com/nbenn),
  [\#390](https://github.com/r-dbi/DBI/issues/390)),
  [`dbCreateTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbCreateTableArrow.md),
  [`dbAppendTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbAppendTableArrow.md)
  ([\#396](https://github.com/r-dbi/DBI/issues/396)),
  [`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md)
  ([\#415](https://github.com/r-dbi/DBI/issues/415)) and
  [`dbFetchArrowChunk()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrowChunk.md)
  ([\#424](https://github.com/r-dbi/DBI/issues/424)), with default
  implementations via nanoarrow
  ([\#414](https://github.com/r-dbi/DBI/issues/414)).

- [`Id()`](https://dbi.r-dbi.org/dev/reference/Id.md) now accepts
  unnamed components ([\#417](https://github.com/r-dbi/DBI/issues/417)).
  If names are provided, the components are arranged in SQL order
  ([@eauleaf](https://github.com/eauleaf),
  [\#427](https://github.com/r-dbi/DBI/issues/427)).

- New [`dbIsValid()`](https://dbi.r-dbi.org/dev/reference/dbIsValid.md)
  method for `"DBIResultArrowDefault"` objects implemented by DBI
  ([\#425](https://github.com/r-dbi/DBI/issues/425)).

- Implement `dbiDataType()` for objects of class `"blob"`.

### Documentation

- Update pkgdown template ([@maelle](https://github.com/maelle),
  [\#428](https://github.com/r-dbi/DBI/issues/428),
  [\#438](https://github.com/r-dbi/DBI/issues/438),
  [\#437](https://github.com/r-dbi/DBI/issues/437)).

- Clarify repeated parameter binding
  ([\#430](https://github.com/r-dbi/DBI/issues/430)).

- Deal with sundown of `https://relational.fit.cvut.cz`
  ([\#423](https://github.com/r-dbi/DBI/issues/423)).

- Correct vignette titles
  ([\#419](https://github.com/r-dbi/DBI/issues/419)).

- Harmonize table documentation
  ([\#400](https://github.com/r-dbi/DBI/issues/400)).

- Tweak typo, add families for data retrieval and command execution.

### Testing

- Enable BLOB tests for arrow \>= 10.0.0
  ([\#395](https://github.com/r-dbi/DBI/issues/395)).

- Run DBItest for SQLite as part of the checks here
  ([\#431](https://github.com/r-dbi/DBI/issues/431)).

- Fix checks without suggested packages
  ([\#420](https://github.com/r-dbi/DBI/issues/420)).

- Fix Windows tests on GHA
  ([\#406](https://github.com/r-dbi/DBI/issues/406)).

- `testthat::use_testthat(3)`
  ([\#416](https://github.com/r-dbi/DBI/issues/416)).

## DBI 1.1.3 (2022-06-18)

### Features

- [`dbAppendTable()`](https://dbi.r-dbi.org/dev/reference/dbAppendTable.md)
  accepts `Id` ([\#381](https://github.com/r-dbi/DBI/issues/381),
  [@renkun-ken](https://github.com/renkun-ken)).

### Documentation

- [`?dbSendQuery`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md)
  and related methods gain a section “The data retrieval flow”
  ([\#386](https://github.com/r-dbi/DBI/issues/386)).

- [`?dbSendStatement`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md)
  and related methods gain a section “The command execution flow”
  ([\#386](https://github.com/r-dbi/DBI/issues/386)).

## DBI 1.1.2 (2021-12-19)

### Features

- Use
  [`dbQuoteLiteral()`](https://dbi.r-dbi.org/dev/reference/dbQuoteLiteral.md)
  in default method for
  [`sqlData()`](https://dbi.r-dbi.org/dev/reference/sqlData.md)
  ([\#362](https://github.com/r-dbi/DBI/issues/362),
  [\#371](https://github.com/r-dbi/DBI/issues/371)).
- Update specification with changes from DBItest 1.7.2
  ([\#367](https://github.com/r-dbi/DBI/issues/367)).

### Documentation

- The pkgdown documentation for DBI generics
  (e.g. [`?dbConnect`](https://dbi.r-dbi.org/dev/reference/dbConnect.md))
  contains clickable links to all known backends (except ROracle), and
  an explanatory sentence
  ([\#360](https://github.com/r-dbi/DBI/issues/360)).
- [`?Id`](https://dbi.r-dbi.org/dev/reference/Id.md) gains better
  examples ([\#295](https://github.com/r-dbi/DBI/issues/295),
  [\#370](https://github.com/r-dbi/DBI/issues/370)).
- Elaborate on status of
  [`dbWriteTable()`](https://dbi.r-dbi.org/dev/reference/dbWriteTable.md)
  in the documentation
  ([\#352](https://github.com/r-dbi/DBI/issues/352),
  [\#372](https://github.com/r-dbi/DBI/issues/372)).
- Make method definition more similar to S3. All
  [`setMethod()`](https://rdrr.io/r/methods/setMethod.html) calls refer
  to top-level functions
  ([\#368](https://github.com/r-dbi/DBI/issues/368)).
- [`?dbReadTable`](https://dbi.r-dbi.org/dev/reference/dbReadTable.md)
  and other pages gain pointers to
  [`Id()`](https://dbi.r-dbi.org/dev/reference/Id.md) and
  [`SQL()`](https://dbi.r-dbi.org/dev/reference/SQL.md)
  ([\#359](https://github.com/r-dbi/DBI/issues/359)).

## DBI 1.1.1 (2021-01-04)

### Documentation

- Expand “Get started” vignette to two tutorials, basic and advanced
  ([\#332](https://github.com/r-dbi/DBI/issues/332),
  [@jawond](https://github.com/jawond)).

### Bug fixes

- [`dbAppendTable()`](https://dbi.r-dbi.org/dev/reference/dbAppendTable.md)
  now allows columns named `sep`
  ([\#336](https://github.com/r-dbi/DBI/issues/336)).
- [`dbAppendTable()`](https://dbi.r-dbi.org/dev/reference/dbAppendTable.md)
  shows a better error message if the input has zero columns
  ([\#313](https://github.com/r-dbi/DBI/issues/313)).
- [`sqlInterpolate()`](https://dbi.r-dbi.org/dev/reference/sqlInterpolate.md)
  now correctly interprets consecutive comments
  ([\#329](https://github.com/r-dbi/DBI/issues/329),
  [@rnorberg](https://github.com/rnorberg)).
- [`dbQuoteLiteral()`](https://dbi.r-dbi.org/dev/reference/dbQuoteLiteral.md)
  works for difftime objects
  ([\#325](https://github.com/r-dbi/DBI/issues/325)).
- [`dbQuoteLiteral()`](https://dbi.r-dbi.org/dev/reference/dbQuoteLiteral.md)
  quotes dates as `YYYY-MM-DD` without time zone
  ([\#331](https://github.com/r-dbi/DBI/issues/331)).

### Internal

- Switch to GitHub Actions
  ([\#326](https://github.com/r-dbi/DBI/issues/326)).
- Update URL in `DESCRIPTION`.

## DBI 1.1.0 (2019-12-15)

### New features

- New `DBIConnector` class
  ([\#280](https://github.com/r-dbi/DBI/issues/280)).

- Specify `immediate` argument to
  [`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md),
  [`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md),
  [`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md)
  and [`dbExecute()`](https://dbi.r-dbi.org/dev/reference/dbExecute.md)
  ([\#268](https://github.com/r-dbi/DBI/issues/268)).

- Use specification for
  [`dbGetInfo()`](https://dbi.r-dbi.org/dev/reference/dbGetInfo.md)
  ([\#271](https://github.com/r-dbi/DBI/issues/271)).

- [`dbUnquoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbUnquoteIdentifier.md)
  now supports [`Id()`](https://dbi.r-dbi.org/dev/reference/Id.md)
  objects with `catalog` members
  ([\#266](https://github.com/r-dbi/DBI/issues/266),
  [@raffscallion](https://github.com/raffscallion)). It also handles
  unquoted identifiers of the form `table`, `schema.table` or
  `catalog.schema.table`, for compatibility with dbplyr.

### Documentation

- New DBI intro article
  ([\#286](https://github.com/r-dbi/DBI/issues/286),
  [@cutterkom](https://github.com/cutterkom)).

- Add pkgdown reference index
  ([\#288](https://github.com/r-dbi/DBI/issues/288)).

- DBI specification on <https://dbi.r-dbi.org/dev/articles/spec> now
  comes with a table of contents and code formatting.

- Update examples to refer to `params` instead of `param`
  ([\#235](https://github.com/r-dbi/DBI/issues/235)).

- Improved documentation for
  [`sqlInterpolate()`](https://dbi.r-dbi.org/dev/reference/sqlInterpolate.md)
  ([\#100](https://github.com/r-dbi/DBI/issues/100)). Add usage of
  [`SQL()`](https://dbi.r-dbi.org/dev/reference/SQL.md) to
  [`sqlInterpolate()`](https://dbi.r-dbi.org/dev/reference/sqlInterpolate.md)
  examples ([\#259](https://github.com/r-dbi/DBI/issues/259),
  [@renkun-ken](https://github.com/renkun-ken)).

- Improve documentation for `Id`.

### Internal

- Add tests for
  [`dbUnquoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbUnquoteIdentifier.md)
  ([\#279](https://github.com/r-dbi/DBI/issues/279),
  [@baileych](https://github.com/baileych)).

- [`sqlInterpolate()`](https://dbi.r-dbi.org/dev/reference/sqlInterpolate.md)
  uses
  [`dbQuoteLiteral()`](https://dbi.r-dbi.org/dev/reference/dbQuoteLiteral.md)
  instead of checking the type of the input.

- Avoid partial argument match in
  [`dbWriteTable()`](https://dbi.r-dbi.org/dev/reference/dbWriteTable.md)
  ([\#246](https://github.com/r-dbi/DBI/issues/246),
  [@richfitz](https://github.com/richfitz)).

## DBI 1.0.0 (2018-05-02)

### New generics

- New
  [`dbAppendTable()`](https://dbi.r-dbi.org/dev/reference/dbAppendTable.md)
  that by default calls
  [`sqlAppendTableTemplate()`](https://dbi.r-dbi.org/dev/reference/sqlAppendTable.md)
  and then
  [`dbExecute()`](https://dbi.r-dbi.org/dev/reference/dbExecute.md) with
  a `param` argument, without support for `row.names` argument
  ([\#74](https://github.com/r-dbi/DBI/issues/74)).
- New
  [`dbCreateTable()`](https://dbi.r-dbi.org/dev/reference/dbCreateTable.md)
  that by default calls
  [`sqlCreateTable()`](https://dbi.r-dbi.org/dev/reference/sqlCreateTable.md)
  and then
  [`dbExecute()`](https://dbi.r-dbi.org/dev/reference/dbExecute.md),
  without support for `row.names` argument
  ([\#74](https://github.com/r-dbi/DBI/issues/74)).
- New
  [`dbCanConnect()`](https://dbi.r-dbi.org/dev/reference/dbCanConnect.md)
  generic with default implementation
  ([\#87](https://github.com/r-dbi/DBI/issues/87)).
- New
  [`dbIsReadOnly()`](https://dbi.r-dbi.org/dev/reference/dbIsReadOnly.md)
  generic with default implementation
  ([\#190](https://github.com/r-dbi/DBI/issues/190),
  [@anhqle](https://github.com/anhqle)).

### Changes

- [`sqlAppendTable()`](https://dbi.r-dbi.org/dev/reference/sqlAppendTable.md)
  now accepts lists for the `values` argument, to support lists of `SQL`
  objects in R 3.1.
- Add default implementation for `dbListFields(DBIConnection, Id)`, this
  relies on `dbQuoteIdentifier(DBIConnection, Id)`
  ([\#75](https://github.com/r-dbi/DBI/issues/75)).

### Documentation updates

- The DBI specification vignette is rendered correctly from the
  installed package ([\#234](https://github.com/r-dbi/DBI/issues/234)).
- Update docs on how to cope with stored procedures
  ([\#242](https://github.com/r-dbi/DBI/issues/242),
  [@aryoda](https://github.com/aryoda)).
- Add “Additional arguments” sections and more examples for
  [`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md),
  [`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md),
  [`dbExecute()`](https://dbi.r-dbi.org/dev/reference/dbExecute.md) and
  [`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md).
- The
  [`dbColumnInfo()`](https://dbi.r-dbi.org/dev/reference/dbColumnInfo.md)
  method is now fully specified
  ([\#75](https://github.com/r-dbi/DBI/issues/75)).
- The
  [`dbListFields()`](https://dbi.r-dbi.org/dev/reference/dbListFields.md)
  method is now fully specified
  ([\#75](https://github.com/r-dbi/DBI/issues/75)).
- The dynamic list of methods in help pages doesn’t contain methods in
  DBI anymore.

### Bug fixes

- Pass missing `value` argument to secondary
  [`dbWriteTable()`](https://dbi.r-dbi.org/dev/reference/dbWriteTable.md)
  call ([\#737](https://github.com/r-dbi/DBI/issues/737),
  [@jimhester](https://github.com/jimhester)).
- The `Id` class now uses `<Id>` and not `<Table>` when printing.
- The default
  [`dbUnquoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbUnquoteIdentifier.md)
  implementation now complies to the spec.

## DBI 0.8 (2018-02-24)

### Breaking changes

- [`SQL()`](https://dbi.r-dbi.org/dev/reference/SQL.md) now strips the
  names from the output if the `names` argument is unset.
- The
  [`dbReadTable()`](https://dbi.r-dbi.org/dev/reference/dbReadTable.md),
  [`dbWriteTable()`](https://dbi.r-dbi.org/dev/reference/dbWriteTable.md),
  [`dbExistsTable()`](https://dbi.r-dbi.org/dev/reference/dbExistsTable.md),
  [`dbRemoveTable()`](https://dbi.r-dbi.org/dev/reference/dbRemoveTable.md),
  and
  [`dbListFields()`](https://dbi.r-dbi.org/dev/reference/dbListFields.md)
  generics now specialize over the first two arguments to support
  implementations with the `Id` S4 class as type for the second
  argument. Some packages may need to update their documentation to
  satisfy R CMD check again.

### New generics

- Schema support: Export
  [`Id()`](https://dbi.r-dbi.org/dev/reference/Id.md), new generics
  [`dbListObjects()`](https://dbi.r-dbi.org/dev/reference/dbListObjects.md)
  and
  [`dbUnquoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbUnquoteIdentifier.md),
  methods for `Id` that call
  [`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md)
  and then forward ([\#220](https://github.com/r-dbi/DBI/issues/220)).
- New
  [`dbQuoteLiteral()`](https://dbi.r-dbi.org/dev/reference/dbQuoteLiteral.md)
  generic. The default implementation uses switchpatch to avoid dispatch
  ambiguities, and forwards to
  [`dbQuoteString()`](https://dbi.r-dbi.org/dev/reference/dbQuoteString.md)
  for character vectors. Backends may override methods that also
  dispatch on the second argument, but in this case also an override for
  the `"SQL"` class is necessary
  ([\#172](https://github.com/r-dbi/DBI/issues/172)).

### Default implementations

- Default implementations of
  [`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md)
  and
  [`dbQuoteLiteral()`](https://dbi.r-dbi.org/dev/reference/dbQuoteLiteral.md)
  preserve names, default implementation of
  [`dbQuoteString()`](https://dbi.r-dbi.org/dev/reference/dbQuoteString.md)
  strips names ([\#173](https://github.com/r-dbi/DBI/issues/173)).
- Specialized methods for
  [`dbQuoteString()`](https://dbi.r-dbi.org/dev/reference/dbQuoteString.md)
  and
  [`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md)
  are available again, for compatibility with clients that use
  [`getMethod()`](https://rdrr.io/r/methods/getMethod.html) to access
  them ([\#218](https://github.com/r-dbi/DBI/issues/218)).
- Add default implementation of
  [`dbListFields()`](https://dbi.r-dbi.org/dev/reference/dbListFields.md).
- The default implementation of
  [`dbReadTable()`](https://dbi.r-dbi.org/dev/reference/dbReadTable.md)
  now has `row.names = FALSE` as default and also supports
  `row.names = NULL` ([\#186](https://github.com/r-dbi/DBI/issues/186)).

### API changes

- The [`SQL()`](https://dbi.r-dbi.org/dev/reference/SQL.md) function
  gains an optional `names` argument which can be used to assign names
  to SQL strings.

### Deprecated generics

- [`dbListConnections()`](https://dbi.r-dbi.org/dev/reference/dbListConnections.md)
  is soft-deprecated by documentation.
- [`dbListResults()`](https://dbi.r-dbi.org/dev/reference/dbListResults.md)
  is deprecated by documentation
  ([\#58](https://github.com/r-dbi/DBI/issues/58)).
- [`dbGetException()`](https://dbi.r-dbi.org/dev/reference/dbGetException.md)
  is soft-deprecated by documentation
  ([\#51](https://github.com/r-dbi/DBI/issues/51)).
- The deprecated `print.list.pairs()` has been removed.

### Bug fixes

- Fix
  [`dbDataType()`](https://dbi.r-dbi.org/dev/reference/dbDataType.md)
  for `AsIs` object ([\#198](https://github.com/r-dbi/DBI/issues/198),
  [@yutannihilation](https://github.com/yutannihilation)).
- Fix
  [`dbQuoteString()`](https://dbi.r-dbi.org/dev/reference/dbQuoteString.md)
  and
  [`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md)
  to ignore invalid UTF-8 strings (r-dbi/DBItest#156).

### Documentation

- Help pages for generics now contain a dynamic list of methods
  implemented by DBI backends
  ([\#162](https://github.com/r-dbi/DBI/issues/162)).
- [`sqlInterpolate()`](https://dbi.r-dbi.org/dev/reference/sqlInterpolate.md)
  now supports both named and positional variables
  ([\#216](https://github.com/r-dbi/DBI/issues/216),
  [@hannesmuehleisen](https://github.com/hannesmuehleisen)).
- Point to db.rstudio.com ([@wibeasley](https://github.com/wibeasley),
  [\#209](https://github.com/r-dbi/DBI/issues/209)).
- Reflect new ‘r-dbi’ organization in `DESCRIPTION`
  ([@wibeasley](https://github.com/wibeasley),
  [\#207](https://github.com/r-dbi/DBI/issues/207)).

### Internal

- Using switchpatch on the second argument for default implementations
  of
  [`dbQuoteString()`](https://dbi.r-dbi.org/dev/reference/dbQuoteString.md)
  and
  [`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md).

## DBI 0.7 (2017-06-17)

- Import updated specs from `DBItest`.
- The default implementation of
  [`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md)
  now accepts an `n` argument and forwards it to
  [`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md). No
  warning about pending rows is issued anymore
  ([\#76](https://github.com/r-dbi/DBI/issues/76)).
- Require R \>= 3.0.0 (for `slots` argument of
  [`setClass()`](https://rdrr.io/r/methods/setClass.html))
  ([\#169](https://github.com/r-dbi/DBI/issues/169),
  [@mvkorpel](https://github.com/mvkorpel)).

## DBI 0.6-1 (2017-04-01)

- Fix
  [`dbReadTable()`](https://dbi.r-dbi.org/dev/reference/dbReadTable.md)
  for backends that do not provide their own implementation
  ([\#171](https://github.com/r-dbi/DBI/issues/171)).

## DBI 0.6 (2017-03-08)

- Interface changes
  - Deprecated
    [`dbDriver()`](https://dbi.r-dbi.org/dev/reference/dbDriver.md) and
    [`dbUnloadDriver()`](https://dbi.r-dbi.org/dev/reference/dbDriver.md)
    by documentation ([\#21](https://github.com/r-dbi/DBI/issues/21)).
  - Renamed arguments to
    [`sqlInterpolate()`](https://dbi.r-dbi.org/dev/reference/sqlInterpolate.md)
    and
    [`sqlParseVariables()`](https://dbi.r-dbi.org/dev/reference/sqlParseVariables.md)
    to be more consistent with the rest of the interface, and added
    `.dots` argument to `sqlParseVariables`. DBI drivers are now
    expected to implement `sqlParseVariables(conn, sql, ..., .dots)` and
    `sqlInterpolate(conn, sql, ...)`
    ([\#147](https://github.com/r-dbi/DBI/issues/147)).
- Interface enhancements
  - Removed `valueClass = "logical"` for those generics where the return
    value is meaningless, to allow backends to return invisibly
    ([\#135](https://github.com/r-dbi/DBI/issues/135)).
  - Avoiding using braces in the definitions of generics if possible, so
    that standard generics can be detected
    ([\#146](https://github.com/r-dbi/DBI/issues/146)).
  - Added default implementation for
    [`dbReadTable()`](https://dbi.r-dbi.org/dev/reference/dbReadTable.md).
  - All standard generics are required to have an ellipsis (with test),
    for future extensibility.
  - Improved default implementation of
    [`dbQuoteString()`](https://dbi.r-dbi.org/dev/reference/dbQuoteString.md)
    and
    [`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md)
    ([\#77](https://github.com/r-dbi/DBI/issues/77)).
  - Removed [`tryCatch()`](https://rdrr.io/r/base/conditions.html) call
    in
    [`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md)
    ([\#113](https://github.com/r-dbi/DBI/issues/113)).
- Documentation improvements
  - Finalized first draft of DBI specification, now in a vignette.
  - Most methods now draw documentation from `DBItest`, only those where
    the behavior is not finally decided don’t do this yet yet.
  - Removed `max.connections` requirement from documentation
    ([\#56](https://github.com/r-dbi/DBI/issues/56)).
  - Improved [`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md)
    documentation and example
    ([\#136](https://github.com/r-dbi/DBI/issues/136)).
  - Change `omegahat.org` URL to `omegahat.net`, the particular document
    still doesn’t exist below the new domain.
- Internal
  - Use roxygen2 inheritance to copy DBI specification to this package.
  - Use `tic` package for building documentation.
  - Use markdown in documentation.

## DBI 0.5-1 (2016-09-09)

- Documentation and example updates.

## DBI 0.5 (2016-08-11, CRAN release)

- Interface changes
  - [`dbDataType()`](https://dbi.r-dbi.org/dev/reference/dbDataType.md)
    maps `character` values to `"TEXT"` by default
    ([\#102](https://github.com/r-dbi/DBI/issues/102)).
  - The default implementation of
    [`dbQuoteString()`](https://dbi.r-dbi.org/dev/reference/dbQuoteString.md)
    doesn’t call
    [`encodeString()`](https://rdrr.io/r/base/encodeString.html)
    anymore: Neither SQLite nor Postgres understand e.g. `\n` in a
    string literal, and all of SQLite, Postgres, and MySQL accept an
    embedded newline ([\#121](https://github.com/r-dbi/DBI/issues/121)).
- Interface enhancements
  - New
    [`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md)
    generic, forwards to
    [`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md)
    by default ([\#20](https://github.com/r-dbi/DBI/issues/20),
    [\#132](https://github.com/r-dbi/DBI/issues/132)).
  - New
    [`dbExecute()`](https://dbi.r-dbi.org/dev/reference/dbExecute.md),
    calls
    [`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md)
    by default ([\#109](https://github.com/r-dbi/DBI/issues/109),
    [@bborgesr](https://github.com/bborgesr)).
  - New
    [`dbWithTransaction()`](https://dbi.r-dbi.org/dev/reference/dbWithTransaction.md)
    that calls
    [`dbBegin()`](https://dbi.r-dbi.org/dev/reference/transactions.md)
    and
    [`dbCommit()`](https://dbi.r-dbi.org/dev/reference/transactions.md),
    and
    [`dbRollback()`](https://dbi.r-dbi.org/dev/reference/transactions.md)
    on failure ([\#110](https://github.com/r-dbi/DBI/issues/110),
    [@bborgesr](https://github.com/bborgesr)).
  - New
    [`dbBreak()`](https://dbi.r-dbi.org/dev/reference/dbWithTransaction.md)
    function which allows aborting from within
    [`dbWithTransaction()`](https://dbi.r-dbi.org/dev/reference/dbWithTransaction.md)
    ([\#115](https://github.com/r-dbi/DBI/issues/115),
    [\#133](https://github.com/r-dbi/DBI/issues/133)).
  - Export [`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md)
    and
    [`dbQuoteString()`](https://dbi.r-dbi.org/dev/reference/dbQuoteString.md)
    methods.
- Documentation improvements:
  - One example per function (except functions scheduled for
    deprecation) ([\#67](https://github.com/r-dbi/DBI/issues/67)).
  - Consistent layout and identifier naming.
  - Better documentation of generics by adding links to the class and
    related generics in the “See also” section under “Other DBI…
    generics” ([\#130](https://github.com/r-dbi/DBI/issues/130)). S4
    documentation is directed to a hidden page to unclutter
    documentation index
    ([\#59](https://github.com/r-dbi/DBI/issues/59)).
  - Fix two minor vignette typos
    ([\#124](https://github.com/r-dbi/DBI/issues/124),
    [@mdsumner](https://github.com/mdsumner)).
  - Add package documentation.
  - Remove misleading parts in
    [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md)
    documentation ([\#118](https://github.com/r-dbi/DBI/issues/118)).
  - Remove misleading link in
    [`dbDataType()`](https://dbi.r-dbi.org/dev/reference/dbDataType.md)
    documentation.
  - Remove full stop from documentation titles.
  - New help topic “DBIspec” that contains the full DBI specification
    (currently work in progress)
    ([\#129](https://github.com/r-dbi/DBI/issues/129)).
  - HTML documentation generated by `staticdocs` is now uploaded to
    <https://rstats-db.github.io/DBI> for each build of the “production”
    branch ([\#131](https://github.com/r-dbi/DBI/issues/131)).
  - Further minor changes and fixes.
- Internal
  - Use `contains` argument instead of
    [`representation()`](https://rdrr.io/r/methods/representation.html)
    to denote base classes
    ([\#93](https://github.com/r-dbi/DBI/issues/93)).
  - Remove redundant declaration of transaction methods
    ([\#110](https://github.com/r-dbi/DBI/issues/110),
    [@bborgesr](https://github.com/bborgesr)).

## DBI 0.4-1 (2016-05-07, CRAN release)

- The default [`show()`](https://rdrr.io/r/methods/show.html)
  implementations silently ignore all errors. Some DBI drivers (e.g.,
  RPostgreSQL) might fail to implement
  [`dbIsValid()`](https://dbi.r-dbi.org/dev/reference/dbIsValid.md) or
  the other methods used.

## DBI 0.4 (2016-04-30)

- New package maintainer: Kirill Müller.

- [`dbGetInfo()`](https://dbi.r-dbi.org/dev/reference/dbGetInfo.md)
  gains a default method that extracts the information from
  [`dbGetStatement()`](https://dbi.r-dbi.org/dev/reference/dbGetStatement.md),
  [`dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md),
  [`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md),
  and
  [`dbGetRowCount()`](https://dbi.r-dbi.org/dev/reference/dbGetRowCount.md).
  This means that most drivers should no longer need to implement
  [`dbGetInfo()`](https://dbi.r-dbi.org/dev/reference/dbGetInfo.md)
  (which may be deprecated anyway at some point)
  ([\#55](https://github.com/r-dbi/DBI/issues/55)).

- [`dbDataType()`](https://dbi.r-dbi.org/dev/reference/dbDataType.md)
  and
  [`dbQuoteString()`](https://dbi.r-dbi.org/dev/reference/dbQuoteString.md)
  are now properly exported.

- The default implementation for
  [`dbDataType()`](https://dbi.r-dbi.org/dev/reference/dbDataType.md)
  (powered by `dbiDataType()`) now also supports `difftime` and `AsIs`
  objects and lists of `raw`
  ([\#70](https://github.com/r-dbi/DBI/issues/70)).

- Default
  [`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md)
  method now always calls
  [`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md), in a
  [`tryCatch()`](https://rdrr.io/r/base/conditions.html) block.

- New generic
  [`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) for
  binding values to a parameterised query.

- DBI gains a number of SQL generation functions. These make it easier
  to write backends by implementing common operations that are slightly
  tricky to do absolutely correctly.

  - [`sqlCreateTable()`](https://dbi.r-dbi.org/dev/reference/sqlCreateTable.md)
    and
    [`sqlAppendTable()`](https://dbi.r-dbi.org/dev/reference/sqlAppendTable.md)
    create tables from a data frame and insert rows into an existing
    table. These will power most implementations of
    [`dbWriteTable()`](https://dbi.r-dbi.org/dev/reference/dbWriteTable.md).
    [`sqlAppendTable()`](https://dbi.r-dbi.org/dev/reference/sqlAppendTable.md)
    is useful for databases that support parameterised queries.

  - [`sqlRownamesToColumn()`](https://dbi.r-dbi.org/dev/reference/rownames.md)
    and
    [`sqlColumnToRownames()`](https://dbi.r-dbi.org/dev/reference/rownames.md)
    provide a standard way of translating row names to and from the
    database.

  - [`sqlInterpolate()`](https://dbi.r-dbi.org/dev/reference/sqlInterpolate.md)
    and
    [`sqlParseVariables()`](https://dbi.r-dbi.org/dev/reference/sqlParseVariables.md)
    allows databases without native parameterised queries to use
    parameterised queries to avoid SQL injection attacks.

  - [`sqlData()`](https://dbi.r-dbi.org/dev/reference/sqlData.md) is a
    new generic that converts a data frame into a data frame suitable
    for sending to the database. This is used to (e.g.) ensure all
    character vectors are encoded as UTF-8, or to convert R varible
    types (like factor) to types supported by the database.

  - The
    [`sqlParseVariablesImpl()`](https://dbi.r-dbi.org/dev/reference/sqlParseVariables.md)
    is now implemented purely in R, with full test coverage
    ([\#83](https://github.com/r-dbi/DBI/issues/83),
    [@hannesmuehleisen](https://github.com/hannesmuehleisen)).

- `dbiCheckCompliance()` has been removed, the functionality is now
  available in the `DBItest` package
  ([\#80](https://github.com/r-dbi/DBI/issues/80)).

- Added default [`show()`](https://rdrr.io/r/methods/show.html) methods
  for driver, connection and results.

- New concrete `ANSIConnection` class and
  [`ANSI()`](https://dbi.r-dbi.org/dev/reference/ANSI.md) function to
  generate a dummy ANSI compliant connection useful for testing.

- Default
  [`dbQuoteString()`](https://dbi.r-dbi.org/dev/reference/dbQuoteString.md)
  and `dbQuoteIdentifer()` methods now use
  [`encodeString()`](https://rdrr.io/r/base/encodeString.html) so that
  special characters like `\n` are correctly escaped.
  [`dbQuoteString()`](https://dbi.r-dbi.org/dev/reference/dbQuoteString.md)
  converts `NA` to (unquoted) NULL.

- The initial DBI proposal and DBI version 1 specification are now
  included as a vignette. These are there mostly for historical
  interest.

- The new `DBItest` package is described in the vignette.

- Deprecated `print.list.pairs()`.

- Removed unused `dbi_dep()`.

## Version 0.3.1

- Actually export
  [`dbIsValid()`](https://dbi.r-dbi.org/dev/reference/dbIsValid.md) :/

- [`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md)
  uses [`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md) in
  the default implementation.

## Version 0.3.0

### New and enhanced generics

- [`dbIsValid()`](https://dbi.r-dbi.org/dev/reference/dbIsValid.md)
  returns a logical value describing whether a connection or result set
  (or other object) is still valid.
  ([\#12](https://github.com/r-dbi/DBI/issues/12)).

- [`dbQuoteString()`](https://dbi.r-dbi.org/dev/reference/dbQuoteString.md)
  and
  [`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md)
  to implement database specific quoting mechanisms.

- [`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md) added as
  alias to [`fetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md)
  to provide consistent name. Implementers should define methods for
  both [`fetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md) and
  [`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md) until
  [`fetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md) is
  deprecated in 2015. For now, the default method for
  [`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md) calls
  [`fetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md).

- [`dbBegin()`](https://dbi.r-dbi.org/dev/reference/transactions.md)
  begins a transaction ([\#17](https://github.com/r-dbi/DBI/issues/17)).
  If not supported, DB specific methods should throw an error (as should
  [`dbCommit()`](https://dbi.r-dbi.org/dev/reference/transactions.md)
  and
  [`dbRollback()`](https://dbi.r-dbi.org/dev/reference/transactions.md)).

### New default methods

- [`dbGetStatement()`](https://dbi.r-dbi.org/dev/reference/dbGetStatement.md),
  [`dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md),
  [`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md),
  and
  [`dbGetRowCount()`](https://dbi.r-dbi.org/dev/reference/dbGetRowCount.md)
  gain default methods that extract the appropriate elements from
  [`dbGetInfo()`](https://dbi.r-dbi.org/dev/reference/dbGetInfo.md).
  This means that most drivers should no longer need to implement these
  methods ([\#13](https://github.com/r-dbi/DBI/issues/13)).

- [`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md)
  gains a default method for `DBIConnection` which uses
  [`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md),
  [`fetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md) and
  [`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md).

### Deprecated features

- The following functions are soft-deprecated. They are going away, and
  developers who use the DBI should begin preparing. The formal
  deprecation process will begin in July 2015, where these function will
  emit warnings on use.

  - [`fetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md) is
    replaced by
    [`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md).

  - [`make.db.names()`](https://dbi.r-dbi.org/dev/reference/make.db.names.md),
    [`isSQLKeyword()`](https://dbi.r-dbi.org/dev/reference/make.db.names.md)
    and
    [`SQLKeywords()`](https://dbi.r-dbi.org/dev/reference/make.db.names.md):
    a black list based approach is fundamentally flawed; instead quote
    strings and identifiers with
    [`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md)
    and
    [`dbQuoteString()`](https://dbi.r-dbi.org/dev/reference/dbQuoteString.md).

- [`dbGetDBIVersion()`](https://dbi.r-dbi.org/dev/reference/dbGetDBIVersion.md)
  is deprecated since it’s now just a thin wrapper around
  `packageVersion("DBI")`.

- [`dbSetDataMappings()`](https://dbi.r-dbi.org/dev/reference/dbSetDataMappings.md)
  ([\#9](https://github.com/r-dbi/DBI/issues/9)) and
  [`dbCallProc()`](https://dbi.r-dbi.org/dev/reference/dbCallProc.md)
  ([\#7](https://github.com/r-dbi/DBI/issues/7)) are deprecated as no
  implementations were ever provided.

### Other improvements

- `dbiCheckCompliance()` makes it easier for implementors to check that
  their package is in compliance with the DBI specification.

- All examples now use the RSQLite package so that you can easily try
  out the code samples ([\#4](https://github.com/r-dbi/DBI/issues/4)).

- [`dbDriver()`](https://dbi.r-dbi.org/dev/reference/dbDriver.md) gains
  a more effective search mechanism that doesn’t rely on packages being
  loaded ([\#1](https://github.com/r-dbi/DBI/issues/1)).

- DBI has been converted to use roxygen2 for documentation, and now most
  functions have their own documentation files. I would love your
  feedback on how we could make the documentation better!

## Version 0.2-7

- Trivial changes (updated package fields, daj)

## Version 0.2-6

- Removed deprecated in some Rd files (thanks to Prof. Ripley)

## Version 0.2-5

- Code cleanups contributed by Matthias Burger: avoid partial argument
  name matching and use TRUE/FALSE, not T/F.

- Change behavior of make.db.names.default to quote SQL keywords if
  allow.keywords is FALSE. Previously, SQL keywords would be name
  mangled with underscores and a digit. Now they are quoted using ‘“’.

## Version 0.2-4

- Changed license from GPL to LPGL

- Fixed a trivial typo in documentation

## Version 0.1-10

- Fixed documentation typos.

## Version 0.1-9

- Trivial changes.

## Version 0.1-8

- A trivial change due to package.description() being deprecated in
  1.9.0.

## Version 0.1-7

- Had to do a substantial re-formatting of the documentation due to
  incompatibilities introduced in 1.8.0 S4 method documentation. The
  contents were not changed (modulo fixing a few typos). Thanks to Kurt
  Hornik and John Chambers for their help.

## Version 0.1-6

- Trivial documentation changes (for R CMD check’s sake)

## Version 0.1-5

- Removed duplicated setGeneric(“dbSetDataMappings”)

## Version 0.1-4

- Removed the “valueClass” from some generic functions, namely,
  dbListConnections, dbListResults, dbGetException, dbGetQuery, and
  dbGetInfo. The reason is that methods for these generics could
  potentially return different classes of objects (e.g., the call
  dbGetInfo(res) could return a list of name-value pairs, while
  dbGetInfo(res, “statement”) could be a character vector).

- Added 00Index to inst/doc

- Added dbGetDBIVersion() (simple wrapper to package.description).

## Version 0.1-3

- ??? Minor changes?

## Version 0.1-2

- An implementation based on version 4 classes and methods.
- Incorporated (mostly Tim Keitt’s) comments.

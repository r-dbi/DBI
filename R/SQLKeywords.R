## SQL ANSI 92 (plus ISO's) keywords --- all 220 of them!
## (See pp. 22 and 23 in X/Open SQL and RDA, 1994, isbn 1-872630-68-8)
#' @export
setGeneric(
  "SQLKeywords",
  def = function(dbObj, ...) standardGeneric("SQLKeywords"),
  valueClass = "character"
)

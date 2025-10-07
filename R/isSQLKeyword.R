#' @rdname make.db.names
#' @export
setGeneric(
  "isSQLKeyword",
  def = function(
    dbObj,
    name,
    keywords = .SQL92Keywords,
    case = c("lower", "upper", "any")[3],
    ...
  ) {
    standardGeneric("isSQLKeyword")
  },
  signature = c("dbObj", "name"),
  valueClass = "logical"
)

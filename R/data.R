NULL

# Coercion rules ---------------------------------------------------------------
coerce <- function(sqlvar, from, to) {
  list(from = from, to = to)
}

sqlDate <- function() {
  coerce(
    function(x) as.integer(x),
    function(x) {
      stopifnot(is.integer(x))
      structure(x, class = "Date")
    }
  )
}

sqlDateTime <- function() {
  coerce(
    function(x) as.numeric(x),
    function(x) {
      stopifnot(is.numeric(x))
      structure(x, class = c("POSIXct", "POSIXt"), tzone = "UTC")
    }
  )
}

sqlSerialize <- function() {
  coerce(
    function(x) {
      lapply(x, serialize, connection = NULL)
    },
    function(x) {
      lapply(x, unserialize)
    }
  )
}

sqlBoolean <- function() {
  coerce(
    function(x) as.integer(x),
    function(x) as.logical(x)
  )
}

sqlFactor <- function(levels) {
  coerce(
    function(x) as.integer(x),
    function(x) factor(x, levels = levels)
  )
}

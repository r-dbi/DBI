as_chunk_callback <- function(x) UseMethod("as_chunk_callback")
as_chunk_callback.function <- function(x) {
  SideEffectChunkCallback$new(x)
}
as_chunk_callback.R6ClassGenerator <- function(x) {
  as_chunk_callback(x$new())
}
as_chunk_callback.ChunkCallback <- function(x) {
  x
}

#' Callback classes
#'
#' These classes are used to define callback behaviors.
#'
#' \describe{
#'  \item{ChunkCallback}{Callback interface definition, all callback functions should inherit from this class.}
#'  \item{SideEffectChunkCallback}{Callback function that is used only for side effects, no results are returned.}
#'  \item{DataFrameCallback}{Callback function that combines each result together at the end.}
#' }
#' @usage NULL
#' @format NULL
#' @name callback
#' @keywords internal
#' @family chunked
#' @examples
#' con <- dbConnect(RSQLite::SQLite(), ":memory:")
#' dbWriteTable(con, "cars", cars)
#'
#' ## Side effects
#' # Ex: return FALSE to stop once you found what you're looking for
#' rowCount <- 0
#' callback <- function(df, index) {
#'   rowCount <<- rowCount + nrow(df)
#'   if (df$speed == 19 && df$dist == 46) {
#'     print(paste("Your row is number", rowCount))
#'     FALSE
#'    }
#'  }
#'
#' # explicitly declare this as a side effects callback:
#' dbGetChunkedQuery(con, "SELECT * FROM cars",
#'   SideEffectChunkCallback$new(callback), n = 5)
#'
#' # or implicitly: if given a regular function, it is automatically
#' # converted to a SideEffectChunkCallback
#' dbGetChunkedQuery(con, "SELECT * FROM cars", callback, n = 5)
#'
#' ## If combined results are desired, you can use the DataFrameCallback
#'
#' distSum <- 0
#' rowCount <- 0
#' callback <- function(df, index) {
#'   distSum <<- distSum + sum(df$dist)
#'   rowCount <<- rowCount + nrow(df)
#' }
#' rs <- dbGetChunkedQuery(con, "SELECT * FROM cars",
#'   DataFrameCallback$new(callback), n = 10)
#'
#' dbDisconnect(con)
ChunkCallback <- R6::R6Class("ChunkCallback",
  private = list(
   callback = NULL
  ),
  public = list(
   initialize = function(callback) NULL,
   receive = function(data, index) NULL,
   continue = function() TRUE,
   result = function() NULL,
   finally = function() NULL
  )
)

#' @usage NULL
#' @format NULL
#' @rdname callback
#' @export
SideEffectChunkCallback <- R6::R6Class("SideEffectChunkCallback", inherit = ChunkCallback,
  private = list(
   cancel = FALSE
  ),
  public = list(
   initialize = function(callback) {
     check_callback_fun(callback)
     private$callback <- callback
   },
   receive = function(data, index) {
     result <- private$callback(data, index)
     private$cancel <- identical(result, FALSE)
   },
   continue = function() {
     !private$cancel
   }
  )
)

#' @usage NULL
#' @format NULL
#' @rdname callback
#' @export
DataFrameCallback <- R6::R6Class("DataFrameCallback", inherit = ChunkCallback,
  private = list(
   results = list()
  ),
  public = list(
   initialize = function(callback) {
     private$callback <- callback
   },
   receive = function(data, index) {
     result <- private$callback(data, index)
     private$results <- c(private$results, list(result))
   },
   result = function() {
     do.call(`rbind`, private$results)
   },
   finally = function() {
     private$results <- list()
   }
  )
)

check_callback_fun <- function(callback) {
  n_args <- length(formals(callback))
  if (n_args < 2) {
    stop("`callback` must have two or more arguments", call. = FALSE)
  }
}

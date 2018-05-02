methods_as_rd <- function(method) {
  if (method == "transactions") {
    method <- c("dbBegin", "dbCommit", "dbRollback")
  }

  methods <- unlist(lapply(method, methods::findMethods), recursive = FALSE)

  # Extracted from roxygen2::object_topic.s4method
  s4_topic <- function(x) {
    sig <- paste0(x@defined, collapse = ",")
    sig_text <- paste0('"', x@defined, '"', collapse = ", ")
    package <- tryCatch(
      getNamespaceName(environment(x@.Data)),
      error = function(e) NA
    )
    if (is.na(package) || package == "DBI") {
      NA_character_
    } else {
      paste0(
        "\\code{\\link[=", x@generic, ",", sig, "-method]{",
        package, "::", x@generic,
        "(", sig_text, ")}}"
      )
    }
  }

  item_text <- vapply(methods@.Data, s4_topic, character(1))
  item_text <- item_text[!is.na(item_text)]

  if (length(item_text) == 0) return("")

  paste0(
    "\\subsection{Methods in other packages}{\n\n",
    "\\itemize{\n",
    paste0("\\item ", item_text, "\n", collapse = ""),
    "}}\n"
  )
}

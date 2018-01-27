methods_as_rd <- function(method) {
  if (method == "transactions") {
    method <- c("dbBegin", "dbCommit", "dbRollback")
  }

  methods <- unlist(lapply(method, methods::findMethods), recursive = FALSE)

  # Extracted from roxygen2::object_topic.s4method
  s4_topic <- function(x) {
    sig <- paste0(x@defined, collapse = ",")
    sig_text <- paste0('"', x@defined, '"', collapse = ", ")
    package <- getNamespaceName(environment(x@.Data))
    paste0(
      "\\code{\\link[=", x@generic, ",", sig, "-method]{",
      package, "::", x@generic,
      "(", sig_text, ")}}"
    )
  }

  if (length(methods@.Data) == 0) return("")

  item_text <- vapply(methods@.Data, s4_topic, character(1))

  paste0(
    "\\subsection{Methods in other packages}{\n\n",
    "\\itemize{\n",
    paste0("\\item ", item_text, "\n", collapse = ""),
    "}}\n"
  )
}

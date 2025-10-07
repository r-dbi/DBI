test_that("interrupting a transaction results in rollback, leaving DB in consistent state", {
  # hard to put in DBItest because need background R process to simulate interrupt
  skip_on_cran()
  skip_if_not_installed("RSQLite")
  skip_if_not_installed("callr")

  bg <- callr::r_bg(
    function() {
      con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
      on.exit(DBI::dbDisconnect(con, shutdown = TRUE), add = TRUE)
      DBI::dbWriteTable(con, 'TEST', data.frame(a = 0L), overwrite = TRUE)

      # First transaction: long sleep, gets interrupted
      tryCatch(
        DBI::dbWithTransaction(con, {
          DBI::dbWriteTable(con, 'TEST', data.frame(a = 1L), overwrite = TRUE)
          Sys.sleep(10)
        }),
        interrupt = function(e) {
          message("Transaction interrupted")
        }
      )

      # Check transaction is aborted with [dbRollback()]
      if (
        !isTRUE(all.equal(DBI::dbReadTable(con, 'TEST'), data.frame(a = 0L)))
      ) {
        stop("did not rollback")
      }

      # Test no errors starting a second transaction after previous interrupted transaction
      DBI::dbWithTransaction(con, {
        Sys.sleep(0.5)
      })

      invisible(TRUE)
    },
    supervise = TRUE
  )

  # Give the background process a moment to start, then interrupt it.
  Sys.sleep(2)
  expect_true(bg$is_alive())
  expect_true(bg$interrupt())

  # Wait for completion and assert no error
  bg$wait()
  expect_equal(bg$get_result(), TRUE)
})

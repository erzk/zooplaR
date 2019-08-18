context("local_info_graphs")

test_that("local_info_graphs works as expected", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()
  
  expect_error(local_info_graphs())
  expect_error(local_info_graphs(1))
  
})
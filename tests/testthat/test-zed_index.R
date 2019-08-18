context("zed_index")

test_that("zed_index works as expected", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()
  
  expect_error(zed_index())
  expect_error(zed_index(1))
})
context("refine_estimate")

test_that("refine_estimate works as expected", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()
  
  expect_error(refine_estimate())
  expect_error(refine_estimate(1))
})
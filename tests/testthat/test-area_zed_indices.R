context("area_zed_indices")

test_that("area_zed_indices works as expected", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()
  
  expect_error(area_zed_indices())
  expect_error(area_zed_indices("W12"))
  
})
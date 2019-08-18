context("geo_autocomplete")

test_that("geo_autocomplete works as expected", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()
  
  expect_error(geo_autocomplete())
  expect_error(geo_autocomplete(1))
  
})
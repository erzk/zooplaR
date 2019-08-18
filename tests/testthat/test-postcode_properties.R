context("postcode_properties")

test_that("postcode_properties works as expected", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()
  
  expect_error(postcode_properties())
  expect_error(postcode_properties(1))
})
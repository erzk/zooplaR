context("property_listings")

test_that("property_listings works as expected", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()
  
  expect_error(property_listings())
  expect_error(property_listings(1))
})
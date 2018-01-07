context("property_listings")

test_that("property_listings works as expected", {
  expect_error(property_listings())
  expect_error(property_listings(1))
})
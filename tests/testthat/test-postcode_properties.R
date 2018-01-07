context("postcode_properties")

test_that("postcode_properties works as expected", {
  expect_error(postcode_properties())
  expect_error(postcode_properties(1))
})
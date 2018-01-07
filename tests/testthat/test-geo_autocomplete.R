context("geo_autocomplete")

test_that("geo_autocomplete works as expected", {
  expect_error(geo_autocomplete())
  expect_error(geo_autocomplete(1))
  
})
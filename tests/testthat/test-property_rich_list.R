context("property_rich_list")

test_that("property_rich_list works as expected", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()
  
  expect_error(property_rich_list())
  expect_error(property_rich_list(1))
})
context("area_value_graphs")

test_that("area_value_graphs works as expected", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()
  
  expect_error(area_value_graphs())
  expect_error(area_value_graphs("W12"))
  
})
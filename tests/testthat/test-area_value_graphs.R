context("area_value_graphs")

test_that("area_value_graphs works as expected", {
  expect_error(area_value_graphs())
  expect_error(area_value_graphs("W12"))
  
})
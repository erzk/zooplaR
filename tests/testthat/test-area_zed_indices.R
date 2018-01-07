context("area_zed_indices")

test_that("area_zed_indices works as expected", {
  expect_error(area_zed_indices())
  expect_error(area_zed_indices("W12"))
  
})
context("refine_estimate")

test_that("refine_estimate works as expected", {
  expect_error(refine_estimate())
  expect_error(refine_estimate(1))
})
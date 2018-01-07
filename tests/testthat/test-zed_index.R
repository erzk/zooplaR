context("zed_index")

test_that("zed_index works as expected", {
  expect_error(zed_index())
  expect_error(zed_index(1))
})
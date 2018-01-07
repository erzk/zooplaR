context("local_info_graphs")

test_that("local_info_graphs works as expected", {
  expect_error(local_info_graphs())
  expect_error(local_info_graphs(1))
  
})
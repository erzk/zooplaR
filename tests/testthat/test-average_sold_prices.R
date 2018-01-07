context("average_sold_prices")

test_that("average_sold_prices works as expected", {
  expect_error(average_sold_prices())
  expect_error(average_sold_prices(1))
  expect_error(average_sold_prices("N"))
})
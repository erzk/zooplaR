context("average_area_sold_price")

test_that("average_area_sold_price works as expected", {
  expect_error(average_area_sold_price())
  expect_error(average_area_sold_price(1))
  
})
context("average_area_sold_price")

test_that("average_area_sold_price works as expected", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()
  
  expect_error(average_area_sold_price())
  expect_error(average_area_sold_price(1))
  
})
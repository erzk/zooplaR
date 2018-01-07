context("property_rich_list")

test_that("property_rich_list works as expected", {
  expect_error(property_rich_list())
  expect_error(property_rich_list(1))
})
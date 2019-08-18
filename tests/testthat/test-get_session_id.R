context("get_session_id")

test_that("get_session_id works as expected", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()
  
  expect_error(get_session_id())
  
})
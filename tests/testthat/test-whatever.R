test_that("multiplication works", {
  expect_equal(print_emoji(mtcars), print(mtcars))
  expect_output(print_emoji(mtcars), "You are")
})

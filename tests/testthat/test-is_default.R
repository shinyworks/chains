test_that("is_default errors for non-implemented methods", {
  stbl::expect_pkg_error_classes(
    is_default(1),
    "chains",
    "not_implemented"
  )
})

test_that("is_default returns FALSE for non-default vrv objects", {
  vrv <- validated_reactive_val(
    value = "good",
    default = "default",
    validation_expr = {
      if (.vrv() == "bad") {
        rlang::abort("is bad")
      }
      .vrv()
    }
  )
  expect_false(isolate(is_default(vrv)))
  vrv("other")
  expect_false(isolate(is_default(vrv)))
})

test_that("is_default returns TRUE for default vrv objects", {
  vrv <- validated_reactive_val(
    value = "good",
    default = "default",
    validation_expr = {
      if (.vrv() == "bad") {
        rlang::abort("is bad")
      }
      .vrv()
    }
  )
  expect_false(isolate(is_default(vrv)))
  vrv("bad")
  expect_true(isolate(is_default(vrv)))
})

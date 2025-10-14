test_that("extract_error errors for non-implemented methods", {
  stbl::expect_pkg_error_classes(
    extract_error(1),
    "chains",
    "not_implemented"
  )
})

test_that("extract_error returns NULL for vrv objects without errors", {
  vrv <- validated_reactive_val(
    value = "good",
    default = "default",
    validation_expr = {
      if (.vrv() == "bad") {
        rlang::abort("is bad", class = "special_error")
      }
      .vrv()
    }
  )
  expect_null(isolate(extract_error(vrv)))
  vrv("other")
  expect_null(isolate(extract_error(vrv)))
})

test_that("extract_error returns captured error for vrv objects with errors", {
  vrv <- validated_reactive_val(
    value = "good",
    default = "default",
    validation_expr = {
      if (.vrv() == "bad") {
        rlang::abort("is bad", class = "special_error")
      }
      .vrv()
    }
  )
  vrv("bad")
  captured_error <- isolate(extract_error(vrv))
  expect_s3_class(captured_error, "captured-error")
  expect_s3_class(captured_error, "captured-special_error")
  expect_equal(captured_error$message, "is bad")
})

test_that("extract_error returns raw error for vrv objects with errors", {
  vrv <- validated_reactive_val(
    value = "good",
    default = "default",
    validation_expr = {
      if (.vrv() == "bad") {
        rlang::abort("is bad", class = "special_error")
      }
      .vrv()
    }
  )
  vrv("bad")
  raw_error <- isolate(extract_error(vrv, capture = FALSE))
  expect_error(rlang::cnd_signal(raw_error), class = "special_error")
  expect_snapshot(
    rlang::cnd_signal(raw_error),
    error = TRUE
  )
})

#' Determine whether a reactive is using its default value
#'
#' A convenience function to check whether an object is currently using its
#' default value. A method is implemented for [validated_reactive_val()] objects.
#'
#' @param x (`any`) The object to test.
#' @param ... Additional arguments passed to methods.
#'
#' @returns A `logical` value indicating whether the object is currently using its
#'   default value.
#' @export
#'
#' @examples
#' vrv <- validated_reactive_val(
#'   value = "good",
#'   default = "default",
#'   validation_expr = {
#'     if (.vrv() == "bad") {
#'       rlang::abort("is bad")
#'     }
#'     .vrv()
#'   }
#' )
#' shiny::isolate(vrv())
#' shiny::isolate(is_default(vrv))
#' vrv("bad")
#' shiny::isolate(vrv())
#' shiny::isolate(is_default(vrv))
is_default <- function(x, ...) {
  UseMethod("is_default")
}

#' @export
is_default.vrv <- function(x, ...) {
  x(get = "is_default")
}

#' @export
is_default.default <- function(x, ...) {
  .chains_abort(
    c(
      "`is_default()` is only implemented for `vrv` objects.",
      i = "{.arg x} is {.obj_type_friendly {x}}."
    ),
    "not_implemented"
  )
}

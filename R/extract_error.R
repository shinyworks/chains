#' Extract an error message from an object
#'
#' A convenience function to extract the error message attached to an object. A
#' method is implemented for [validated_reactive_val()] objects.
#'
#' @param x (`any`) The object from which to extract the error message.
#' @param ... Additional arguments passed to methods.
#' @param capture (length-1 `logical`) If `TRUE`, the error is captured and
#'   returned with class `captured-error` (as well as `captured-` prepended on
#'   any error subclasses). If `FALSE`, the error is thrown.
#'
#' @returns If the object contains an error message, an object with class
#'   `captured-error` if `capture` is `TRUE` or the error condition if `capture`
#'   is `FALSE`. Depending on your purpose, you may need to [signalCondition()]
#'   or [rlang::cnd_signal()] to actually signal the error. If the object does
#'   not contain an error, `NULL`.
#' @export
#'
#' @examples
#' vrv <- validated_reactive_val(
#'   value = "good",
#'   default = "default",
#'   validation_expr = {
#'     if (.vrv() == "bad") {
#'       rlang::abort("is bad", class = "special_error")
#'     }
#'     .vrv()
#'   }
#' )
#' shiny::isolate(extract_error(vrv))
#' vrv("bad")
#' shiny::isolate(vrv())
#' captured_error <- shiny::isolate(extract_error(vrv))
#' class(captured_error)
#' captured_error$message
#' raw_error <- shiny::isolate(extract_error(vrv, capture = FALSE))
#' try(rlang::cnd_signal(raw_error))
extract_error <- function(x, ..., capture = TRUE) {
  UseMethod("extract_error")
}

#' @export
extract_error.vrv <- function(x, ..., capture = TRUE) {
  captured_error <- x(get = "error")
  if (is.null(captured_error)) {
    return(NULL)
  }
  if (capture) {
    return(captured_error)
  }
  class(captured_error) <- sub("captured-", "", class(captured_error))
  return(captured_error)
}

#' @export
extract_error.default <- function(x, ..., capture = TRUE) {
  .chains_abort(
    c(
      "`extract_error()` is only implemented for `vrv` objects.",
      i = "{.arg x} is {.obj_type_friendly {x}}."
    ),
    "not_implemented"
  )
}

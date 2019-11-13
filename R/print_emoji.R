#' Prints an uplifting message and a thumbs up.
#' @param x a dataframe
#' @param ... arguments passed to \code{\link{print}}
#' @export
print_emoji <- function(x, ...) {
  UseMethod("print_emoji")
}

#' @export
#' @rdname print_emoji
#' @importFrom crayon cyan
#' @import emo
#' @examples
#' print_emoji(mtcars)
print_emoji.data.frame <- function(x, ...) {
  cat(cyan(praise::praise()), ji("thumbs up"))
  print.data.frame(x, ...)
}

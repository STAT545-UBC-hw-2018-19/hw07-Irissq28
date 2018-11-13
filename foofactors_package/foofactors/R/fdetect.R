#' Detect whether a factor that should be character
#'
#' This function is used to detect factors that should be character based on the fact that the length of character equals the number of its unique values, however, factor doesn't have that characteristic.
#' @usage fdetect(x)
#' @param x factor
#'
#' @return This funciton returns a boolean value, if the input is a factor then it returns TRUE, if the input is a character then it returns FALSE.
#' @export
#' @examples
#' FALSE
#' fdetect(factor(c("a","b","c")))
#' TRUE
#' fdetect(factor(c("a","b","c","b")))
fdetect <- function(x) {
  ifelse(length(unique(x)) != length(x), TRUE, FALSE)
}


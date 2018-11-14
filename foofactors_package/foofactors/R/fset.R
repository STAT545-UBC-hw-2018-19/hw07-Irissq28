#' @title Set the levels
#'
#' @description This function is used to set levels to the order in which they appear in the data
#' @usage
#' fset(x)
#'
#' @param x a factor. It will come to an error if it is not a factor.
#'
#' @return
#' a factor
#'
#' @examples
#' fset(factor(c("c", "d", "b", "a"))) # Levels: c d b a
#'
#' @export

fset <- function(x) {
  # check the input
  fcheck(x)
  # return a factor with reset levels
  return(factor(x, as.character(unique(x))))
}

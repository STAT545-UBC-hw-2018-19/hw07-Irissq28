#' Levels and number of levels
#'
#' This function returns the levels and the number of levels which its factor has.
#'
#' @param x factor
#'
#' @return levels
#' @return number of levels
#' @export
#' @examples
#' flevel(iris$Species)
flevel <- function(x) {
  # check whether the input value is factor or not
  fcheck(x)
  # get the levels of a factor
  ls <- levels(x)
  # get the number of levels
  numls <- nlevels(x)
  # combine the two arguments
  lev <- c(ls,numls)
  return(lev)
}

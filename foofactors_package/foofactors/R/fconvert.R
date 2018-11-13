#' Convert input to a factor
#'
#' This function is used to encode a vector/vectors as a factor/factors
#'
#' @param x vector(s)
#'
#' @return factor(s)
#' @export
#' @examples
#' fconvert("apple")
#' fconvert(c("low","medium","high"))
fconvert <- function(x) {
  # check whether the input value is factor or not
  # if it isn't a factor then convert it into a factor
  if(!is.factor(x)){
    as.factor(x)
  }
}

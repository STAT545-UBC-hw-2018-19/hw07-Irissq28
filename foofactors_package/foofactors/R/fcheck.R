#' Check the input
#'
#' Check whether the input is a factor or not, if it's not a factor, then the function wil throw an error.
#' @usage fcheck(x)
#' @param x factor
#'
#' @return Nothing, if it comes to an error, it will stop
#' @export
#' @examples
#' fcheck(iris$Species)
fcheck <- function(x) {
  # check whether the input value is factor or not
  if(!is.factor(x)){
    stop("Function requires a factor as input")
  }
}

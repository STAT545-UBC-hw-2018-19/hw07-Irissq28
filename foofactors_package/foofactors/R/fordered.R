#' Set levels in order
#'
#' @description fordered(x) is the function used to sets levels to the order in which they appear in the data, the input should be a factor, otherwise, the function will come to an error.
#' fdesc(x) is used to reorder factor in descenging order, it will come to an error when the param is not a factor.
#' @usage fordered(x)
#' @param x factor
#' @return fordered(x) returns ordered levels
#' @export
#' @rdname order_doc
#' @examples
#' fordered(iris$Species) # Levels: setosa < versicolor < virginica
fordered <- function(x) {
  # check whether the input value is factor or not
  fcheck(x)
  # returns ordered levels.
  return(ordered(unique(x)))
}



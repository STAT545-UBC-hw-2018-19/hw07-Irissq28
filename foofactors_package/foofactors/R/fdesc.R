#' Reorder a factor in descending order
#'
#' This function is used to reorder factor in descenging order, it will come to an error when the param is not a factor.
#' @usage fdesc(x)
#' @return fdesc(x) returns a factor in descending order
#' @export
#' @rdname order_doc
#' @examples
#' fdesc(factor(c("a","b","c"))) # Levels: c b a
#' fdesc(iris$Species) # Levels: virginica versicolor setosa
fdesc <- function(x) {
  # check whether the input value is factor or not
  fcheck(x)
  xdesc <- dplyr::desc(x)
  return(stats::reorder(x, xdesc))
}


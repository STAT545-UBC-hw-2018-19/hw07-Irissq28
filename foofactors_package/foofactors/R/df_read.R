#' @usage df_read(filename)
#' @return df_read() returns a data frame read from a txt file
#' @rdname df_write_read
#' @example df_read(filename = "df.txt")
#' @export

df_read <- function(filename){
  # check whether the file is .txt file or not
  if(tools::file_ext(filename) != "txt"){
    stop("File type requires a plain text delimited file")
  }
  return(dget(filename))
}

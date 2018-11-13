#' @title Write and read data frame to/from text files
#' @description This function is used to write and read data frames to plain text delimited files while retaining factor levels.
#' @usage df_write(df, filename)
#' @param df data frame
#' @param filename A string, which is the name of the data frame .txt file, the input text file need to save the same folder with the R script folder, if it's not a ".txt" file, this function will come to an error.
#' @return df_write() returns nothing
#' @rdname df_write_read
#' @export

df_write <- function(df, filename){
  # check whether the input is a data frame or not
  if(!is.data.frame(df)){
    stop("Function requires a data frame as input")
  }
  # check the output file
  if(tools::file_ext(filename) != "txt"){
    stop("File type requires a plain text delimited file")
  }
  dput(df,filename)
}



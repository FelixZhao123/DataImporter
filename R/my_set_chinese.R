# This function is to set the Chinese environment for reading data with Chinese characters

my_set_chinese <- function(x){
  x <- "chinese"
  Sys.setlocale(category="LC_ALL",locale=x)
}

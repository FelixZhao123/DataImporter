## scale numbers between 0-1

my_scale <- function(x){
  (x-min(x,na.rm = TRUE))/(max(x,na.rm = TRUE)-min(x,na.rm = TRUE))
}



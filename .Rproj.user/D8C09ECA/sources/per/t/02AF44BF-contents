# This function is to create glm binary plot
################################################
#### BUGS NEED TO BE FIXED#####################

###############################


library(tidyverse)


my_glm_plot <- function(data,x,y){
    ggplot(data,aes(x=x, y=y)) +
    geom_smooth(method = "glm",
                method.args = list(family = "binomial"),
                se = FALSE)
}


mtcars <- mtcars %>% as_tibble()

my_glm_plot(mtcars,x=wt,y=vs)

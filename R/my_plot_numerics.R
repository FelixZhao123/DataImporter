## this function is to create density plot for all numeric variables in a data frame

library(tidyverse)
library(hrbrthemes)

my_plot_numerics <- function(df){
  df <- df %>%
    select_if(is.numeric)

  last_col <- ncol(df)

  plot <- df %>%
    pivot_longer(1:last_col,names_to="variable_name",values_to = "value") %>%
    ggplot(aes(x=value,fill=variable_name))+
    geom_density(alpha=0.5,show.legend=FALSE)+
    facet_wrap(~variable_name,ncol = 4,scales = "free")+
    labs(
      title="Density Plots for All Numeric Variables"
    )+
    theme_ipsum_rc()

  return(plot)

}





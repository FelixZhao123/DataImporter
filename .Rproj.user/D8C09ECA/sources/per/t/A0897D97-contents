## import the latest spa type info
library(tidyverse)
library(readxl)
my_import_spa_type <- function(x){
  x <- fs::dir_ls("C:/Users/chn-fzj/OneDrive - Panduit Corporation/Desktop/Sales Operations/Sales Ops/SPA Types Archive",
                            glob = "*.xlsx") %>% max()
  latest_spa_type <- read_xlsx(x,sheet = "SPA List",col_names = TRUE) %>%
    janitor::clean_names()

  return(latest_spa_type)

}




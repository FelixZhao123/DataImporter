## this function is to look up validated vertical markets for JAPAN, CHINA and AUSTRALIA

library(tidyverse)
library(stringr)
library(lubridate)
library(readxl)
library(fs)

my_consolidate_vms <- function(chn,aus,jpn){
  files <- fs::dir_ls("C:/Users/chn-fzj/OneDrive - Panduit Corporation/Desktop/Sales Operations/Channel Development/Vertical Markets Validation")

  chn <- read_csv(files[2],col_names = TRUE) %>%
    janitor::clean_names() %>%
    mutate(adjust_vm =if_else(is.na(adjust_vm),vertical_market_segment,adjust_vm)) %>%
    mutate(adjust_vm=str_to_upper(adjust_vm)) %>%
    rename(validated_vertical_market=adjust_vm) %>%
    distinct(spa_number,validated_vertical_market)

  aus <- read_xlsx(files[1],col_names = TRUE,skip = 2,sheet = "SPA Details with Sales") %>%
    janitor::clean_names() %>%
    rename(validated_vertical_market=sub_market) %>%
    mutate(validated_vertical_market=str_to_upper(validated_vertical_market)) %>%
    distinct(spa_number,validated_vertical_market)

  jpn <- read_xlsx(files[3],col_names = TRUE,sheet = "Raw Data") %>%
    janitor::clean_names() %>%
    rename(validated_vertical_market=vertical_market_sub_category) %>%
    distinct(spa_number,validated_vertical_market) %>%
    filter(!is.na(validated_vertical_market))

  spa_vertical_markets <- chn %>%
    bind_rows(aus) %>%
    bind_rows(jpn)

  return(spa_vertical_markets)

}



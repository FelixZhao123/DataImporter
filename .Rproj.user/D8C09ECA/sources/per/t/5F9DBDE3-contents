# This function is to import all global ots data from local drive

library(tidyverse)
library(lubridate)
library(stringr)
library(vroom)
library(fs)





my_import_ots <- function(x,single_import){
  x <- fs::dir_ls(
    path = "C:/Users/chn-fzj/OneDrive - Panduit Corporation/Desktop/Supply Chain Optimization Projects/Supply Chain Comprehensive Analysis/Data-Global OTS CSV by Month",glob = "*.csv")
  single_import <- function(x){
    read_csv(x,col_names = TRUE,col_types = cols(
      `Account Number`=col_character(),
      `Ordered Date`=col_character(),
      `Booked Date`=col_character(),
      `Request Date`=col_character(),
      `Original Ship Date`=col_character(),
      `Promised Date`=col_character(),
      `Schedule Ship Date`=col_character(),
      `Available To Whse Date`=col_character(),
      `Planned Departure Date`=col_character(),
      `Actual Shipment Date`=col_character(),
      `Ship Date`=col_character(),
      `Ship Month`=col_character()
    )) %>%
      filter(`Marketing Region`=="ASIA PACIFIC") %>%
      filter(`SPI Organization Code` %in% c("AUS","CHS","CHC","CHW","CWW","SGC","JPN","SGW"))}
  map_df(x,single_import) %>%
    mutate(
      `Ordered Date`=mdy(`Ordered Date`),
      `Booked Date`=mdy(`Booked Date`),
      `Request Date`=mdy(`Request Date`),
      `Original Ship Date`=mdy(`Original Ship Date`),
      `Promised Date`=mdy(`Promised Date`),
      `Schedule Ship Date`=mdy(`Schedule Ship Date`),
      `Available To Whse Date`=mdy(`Available To Whse Date`),
      `Planned Departure Date`=mdy(`Planned Departure Date`),
      `Actual Shipment Date`=mdy(`Actual Shipment Date`),
      `Ship Date`=mdy(`Ship Date`),
      `Ship Month`=mdy(`Ship Month`)
    ) %>%
    mutate(Region=case_when(
      `SPI Organization Code`=="AUS"~"AUSTRALIA",
      `SPI Organization Code`=="JPN"~"JAPAN",
      `SPI Organization Code`=='SGW'~"SINGAPORE",
      TRUE~"CHINA"
    )) %>% janitor::clean_names()
}

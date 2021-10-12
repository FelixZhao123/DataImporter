# this function is to import the Asia Pacific Sales Transactions fast with vroom

library(tidyverse)
library(vroom)
library(stringr)
library(lubridate)
library(vroom)
library(fs)


my_import_ap_sales_fast <- function(x){
  x <- fs::dir_ls(
    path = "C:/Users/chn-fzj/OneDrive - Panduit Corporation/Desktop/Supply Chain Optimization Projects/Supply Chain Comprehensive Analysis/Data-Global Sales Orders Archived/Year to Date",glob = "*.csv")

  vroom(x,delim = ",",col_names = TRUE,skip = 1,col_types = c(`Order No`="c")) %>%
    janitor::clean_names() %>%
    filter(marketing_region=="ASIA PACIFIC") %>%
    filter(part_no!="ADJUSTMENT") %>%
    rename(revenue=constant_usd_accrued_sum,
           units=units_sold_sum,
           revenue_country=revenue_account_country_description) %>%
    filter(revenue>0) %>%
    mutate(order_date=mdy(order_date),
           shipped_date_requested=mdy(shipped_date_requested),
           ship_date=mdy(ship_date),
           revenue=as.numeric(str_remove_all(revenue,"\\,")),
           units=as.numeric(str_remove_all(units,"\\,")))
}

# this function is to import the Asia Pacific Sales Transactions fast with vroom

library(tidyverse)
library(vroom)
library(stringr)
library(lubridate)
library(vroom)
library(fs)


my_import_ap_orders <- function(x){
  x <- fs::dir_ls(
    path = "C:/Users/chn-fzj/OneDrive - Panduit Corporation/Desktop/Sales Operations/Sales Ops/Sales Order Transactional Archive",glob = "*.csv")

  vroom(x,delim = ",",col_names = TRUE,skip = 1,col_types = c(`Order No`="c",
                                                              `3 Digit Product Line`="c",
                                                              `Line Item Number`="c")) %>%
    janitor::clean_names() %>%
    filter(part_no!="ADJUSTMENT") %>%
    rename(units=units_sold_sum,
           revenue_country=revenue_account_country_description,
           pl=x3_digit_product_line,
           pl_description=x3_digit_product_line_description,
           revenue=transactional_constant_usd_ext_amount_by_market,
           variable_cost=transactional_constant_usd_ext_variable_cost_sum,
           std_cost=transactional_constant_usd_ext_standard_cost_by_market) %>%
    mutate(order_date=mdy(order_date),
           shipped_date_requested=mdy(shipped_date_requested),
           ship_date=mdy(ship_date),
           units=as.numeric(str_remove_all(units,"\\,")))
}




## function to import transnational sales data


my_import_transactional <- function(x){
  x <- "C:/Users/chn-fzj/OneDrive - Panduit Corporation/Desktop/Sales Operations/Channel Development/Transactional Data Aligned/Region-product category (1).csv"
  data <- vroom::vroom(x,col_names = TRUE,skip = 1) %>%
    janitor::clean_names() %>%
    dplyr::rename(
      account_country=revenue_account_country,
      product_segment=product_category_segment,
      sub_category=product_sub_category,
      local_chain=local_chain_name,
      global_chain=global_chain_name,
      market_owner=transactional_business_market_owner,
      transactional_amount=transactional_constant_usd_ext_amount_by_market,
      transactional_standard_cost=transactional_constant_usd_ext_standard_cost_by_market,
      transactional_variable_cost=transactional_constant_usd_ext_variable_cost_sum)
  return(data)
}

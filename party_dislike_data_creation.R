library(tidyverse)
library(haven)
library(here)

#file<-here::here('Data/anes_timeseries_cdf_stata_20260205.zip')
#unzip("anes_timeseries_cdf_stata_20260205.zip")
#anes_cumulative_data <- read_dta("anes_timeseries_cdf_stata_20260205.zip") 


#anes_cumulative <- anes_cumulative_data |>
#  select(year = VCF0004, 
#         weight = VCF0009z,
#         party_id = VCF0303,
#         ideology = VCF0803,
#         dem_therm = VCF0201,
#         rep_therm = VCF0202,
#         lib_therm = VCF0211,
#         cons_therm = VCF0212) |>
#  mutate(
#    party_id = case_when(
#      party_id == 1 ~ "Democrat",
#      party_id == 2 ~ "Independent",
#      party_id == 3 ~ "Republican",
#      TRUE ~ NA),
#    ideology = case_when(
#      ideology %in% c(1, 2, 3) ~ "Liberal",
#      ideology == 4 ~ "Moderate",
#      ideology %in% c(5, 6, 7) ~ "Conservative",
#      TRUE ~ NA),
#    dem_therm = case_when(
#      as.numeric(dem_therm) <0 | as.numeric(dem_therm)>97 ~ NA,
#      .default = as.numeric(dem_therm)),
#    rep_therm = case_when(
#      as.numeric(rep_therm) <0 | as.numeric(rep_therm)>97 ~ NA,
#      .default = as.numeric(rep_therm)),
#    lib_therm = case_when(
#      as.numeric(lib_therm) <0 | as.numeric(lib_therm)>97 ~ NA,
#      .default = as.numeric(lib_therm)),
#    cons_therm = case_when(
#      as.numeric(cons_therm) <0 | as.numeric(cons_therm)>97 ~ NA,
#      .default = as.numeric(cons_therm)))
    
#write_csv(anes_cumulative, "party_dislike_data.csv")

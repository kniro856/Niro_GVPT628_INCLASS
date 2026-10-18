library(tidyverse)
library(haven)
library(here)

#file<-here::here('Data/anes_timeseries_cdf_stata_20260205.zip')
#unzip("anes_timeseries_cdf_stata_20260205.zip")
#anes_cumulative <- read_dta("anes_timeseries_cdf_stata_20260205.zip") 

#sorting <- anes_cumulative |>
#  select(
#    year = VCF0004,
#    weight = VCF0009z,
#    party_id = VCF0301,
#    ideology = VCF0803
#  ) |>
#  mutate(
    
    # Collapse party identification
#    party = case_when(
#      party_id %in% c(1, 2) ~ "Democrat",
#      party_id %in% c(6, 7) ~ "Republican",
#      .default = NA_character_
#    ),
    
    # Collapse ideology
#    ideology_group = case_when(
#      ideology %in% c(1, 2, 3) ~ "Liberal",
#      ideology == 4 ~ "Moderate",
#      ideology %in% c(5, 6, 7) ~ "Conservative",
#      .default = NA_character_
#    )
#  )


#write_csv(sorting, "sorting.csv")

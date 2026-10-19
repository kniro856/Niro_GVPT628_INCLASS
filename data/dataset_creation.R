### code to create new, workable data set

#anes_cumulative <- read_dta("anes_timeseries_cdf_stata_20260205.zip") 

#anes <- anes_cumulative |>
#  select(c("VCF0004", "VCF0006", "VCF0009z", 
#           "VCF0303", "VCF0305", "VCF0803", #Question 1
#           "VCF0104", "VCF0105b",           #Question 2
#           "VCF9131", "VCF0853", "VCF9013", #Question 3
#           "VCF0315", "VCF0319"))           #Question 4

#anes <- anes |>
#  rename("year" = VCF0004, 
         #Year of Study
#         "respondent" = VCF0006, 
         #Study Respondent Number: Year-level Case ID
         
#         "weights" = VCF0009z, 
         #Weight: For 1970 type 0; 2012-2024 full sample
         
#         "party" = VCF0303, 
         #Party Identification of Respondent- Summary 3-Category
         
#         "pstrength" = VCF0305, 
         #Party Identification of Respondent- Strength of Partisanship
         
#         "ideo" = VCF0803, 
         #Liberal-Conservative Scale
         
#        "gender" = VCF0104, 
         #Respondent - Gender
         
#         "raceeth" = VCF0105b, 
         #Race-ethnicity summary, 4 categories
         
#         "gov_lessmore" = VCF9131, 
         #Less government better or government do more
         
#         "tradval" = VCF0853,  
         #Should be More Emphasis on Traditional Values
         
#         "ensure_eq" = VCF9013, 
         #Society ensure equal opportunity to succeed
         
#         "d_dislike" = VCF0315,
         #Democratic Party: Respondent Dislikes - Number of Mentions
         
#         "r_dislike" = VCF0319)
#Republican Party: Respondent Dislikes - Number of Mentions


#anes <- anes |>
#  mutate(
#    party = case_when(
#      party == 1 ~ "Democrat",
#      party == 2 ~ "Independent",
#      party == 3 ~ "Republican",
#      TRUE ~ NA),
    
#    pstrength = case_when(
#      pstrength == 1 ~ "Non-Partisan",
#      pstrength == 2 ~ "Weak Partisan",
#      pstrength == 3 ~ "Weak Partisan",
#      pstrength == 4 ~ "Strong Partisan",
#      TRUE ~ NA),
    
#    ideo3 = case_when(
#      ideo %in% c(1, 2, 3) ~ "Liberal",
#      ideo == 4 ~ "Moderate",
#      ideo %in% c(5, 6, 7) ~ "Conservative",
#      TRUE ~ NA),
    
#    istrength = case_when(
#      ideo %in% c(1, 7) ~ "Extreme Ideology",
#      ideo %in% c(2, 3, 5, 6) ~ "Moderate Ideology",
#      ideo %in% c(4) ~ "Weak Ideology",
#      TRUE ~ NA),
    
#    gender = case_when(
#      gender == 1 ~ "Male",
#      gender == 2 ~ "Female",
#      TRUE ~ NA),
    
#    raceeth = case_when(
#      raceeth == 1 ~ "White non-Hispanic",
#      raceeth == 2 ~ "Black non-Hispanic",
#      raceeth == 3 ~ "Hispanic",
#      raceeth == 4 ~ "Other non-Hispanic",
#      TRUE ~ NA),
    
#    gov_lessmore = case_when(
#      gov_lessmore == 1 ~ "Less Government",
#      gov_lessmore == 2 ~ "More Government",
#      TRUE ~ NA),
    
#    tradval = case_when(
#      tradval %in% c(1, 2) ~ "Agree",
#      tradval %in% c(4, 5) ~ "Disagree",
#      tradval == 3 ~ "Neutral",
#      TRUE ~ NA),
    
#    ensure_eq = case_when(
#      ensure_eq %in% c(1, 2) ~ "Agree",
#      ensure_eq %in% c(4, 5) ~ "Disagree",
#      ensure_eq == 3 ~ "Neutral",
#      TRUE ~ NA),
    
#    d_dislike = case_when(
#      d_dislike == 0 ~ 0,
#      d_dislike == 1 ~ 1, 
#      d_dislike == 2 ~ 2,
#      d_dislike == 3 ~ 3,
#      d_dislike == 4 ~ 4,
#      d_dislike == 5 ~ 5,
#      TRUE ~ NA),
    
#    r_dislike = case_when(
#      r_dislike == 0 ~ 0,
#      r_dislike == 1 ~ 1, 
#      r_dislike == 2 ~ 2,
#      r_dislike == 3 ~ 3,
#      r_dislike == 4 ~ 4,
#      r_dislike == 5 ~ 5,
#      TRUE ~ NA)
    
#  )

#Indicator Variables

#anes_read <- anes |>
#  mutate(
    
#    dem_i = as.numeric(party == "Democrat"),
#    rep_i = as.numeric(party == "Republican"),
#    ind_i = as.numeric(party == "Independent"),
    
#    nonp_i = as.numeric(pstrength == "Non-Partisan"),
#    weakp_i = as.numeric(pstrength == "Weak Partisan"),
#    strongp_i = as.numeric(pstrength == "Strong Partisan"),
    
#    lib_i = as.numeric(ideo3 == "Liberal"),
#    con_i = as.numeric(ideo3 == "Conservative"),
#    mod_i = as.numeric(ideo3 == "Moderate"),
    
#    exti_i = as.numeric(istrength == "Extreme Ideology"),
#    modi_i = as.numeric(istrength == "Moderate Ideology"),
#    weaki_i = as.numeric(istrength == "Weak Ideology"),
    
#    gmore_i = as.numeric(gov_lessmore == "More Government"),
    
#    tagr_i = as.numeric(tradval == "Agree"),
    
#    eqagr_i = as.numeric(ensure_eq == "Agree"),
    
#  )

#write_csv(anes_read, "anes_working_data.csv")
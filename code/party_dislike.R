library(tidyverse)
library(haven)
library(here)
library(readr)

party_dislike <- read_csv("party_dislike_data.csv")

View(party_dislike)


# party dislike
anes_party_dislike <- party_dislike |>
  mutate(
    opposing_party_therm = case_when(
      party_id == "Republican" ~ dem_therm,
      party_id == "Democrat" ~ rep_therm,
      TRUE ~ NA_real_
    )
  )

party_dislike_by_year <- anes_party_dislike |>
  group_by(year, party_id) |>
  summarize(
    mean_opposing_party_therm = mean(
      opposing_party_therm,
      na.rm = TRUE
    ),
    n = n()
  ) |>
  drop_na() |>
  ungroup()


ggplot(party_dislike_by_year,
       aes(x = year,
           y = mean_opposing_party_therm,
           color = party_id)) +
  geom_line(linewidth = 1) +
  geom_point() +
  theme_minimal() +
  labs(
    title = "Feelings Toward Members of the Opposing Party",
    x = "Year",
    y = "Average Feelings (0-100) Toward the Opposing Party",
    color = "Party Identification"
  ) +
  scale_y_continuous(limits = c(0, 100)) +
  scale_color_manual(values = c("Democrat" = "#1717D4", "Republican" = "#DB1A1A"))


# party like
anes_party_like <- party_dislike |>
  mutate(
    same_party_therm = case_when(
      party_id == "Republican" ~ rep_therm,
      party_id == "Democrat" ~ dem_therm,
      TRUE ~ NA_real_
    )
  )

party_like_by_year <- anes_party_like |>
  group_by(year, party_id) |>
  summarize(
    mean_same_party_therm = mean(
      same_party_therm,
      na.rm = TRUE
    ),
    n = n()
  ) |>
  drop_na() |>
  ungroup()


ggplot(party_like_by_year,
       aes(x = year,
           y = mean_same_party_therm,
           color = party_id)) +
  geom_line(linewidth = 1) +
  geom_point() +
  theme_minimal() +
  labs(
    title = "Feelings Toward Members of the Same Party",
    x = "Year",
    y = "Average Feelings (0-100) Toward the Same Party",
    color = "Party Identification"
  ) +
  scale_y_continuous(limits = c(0, 100)) +
  scale_color_manual(values = c("Democrat" = "#1717D4", "Republican" = "#DB1A1A"))


# ideological dislike

anes_ideo_dislike <- party_dislike |>
  mutate(
    opposing_ideo_therm = case_when(
      ideology == "Conservative" ~ lib_therm,
      ideology == "Liberal" ~ cons_therm,
      TRUE ~ NA_real_
    )
  )

ideo_dislike_by_year <- anes_ideo_dislike |>
  group_by(year, ideology) |>
  summarize(
    mean_opposing_ideo_therm = mean(
      opposing_ideo_therm,
      na.rm = TRUE
    ),
    n = n()
  ) |>
  drop_na() |>
  ungroup()


ggplot(ideo_dislike_by_year,
       aes(x = year,
           y = mean_opposing_ideo_therm,
           color = ideology)) +
  geom_line(linewidth = 1) +
  geom_point() +
  theme_minimal() +
  labs(
    title = "Feelings Toward the Opposing Ideological Group",
    x = "Year",
    y = "Average Feelings (0-100) Toward the Opposing Ideology",
    color = "Ideological Identification"
  ) +
  scale_y_continuous(limits = c(0, 100)) +
  scale_color_manual(values = c("Liberal" = "#52BAF2", "Conservative" = "#F25252"))

# ideological like

anes_ideo_like <- party_dislike |>
  mutate(
    same_ideo_therm = case_when(
      ideology == "Conservative" ~ cons_therm,
      ideology == "Liberal" ~ lib_therm,
      TRUE ~ NA_real_
    )
  )

ideo_like_by_year <- anes_ideo_like |>
  group_by(year, ideology) |>
  summarize(
    mean_same_ideo_therm = mean(
      same_ideo_therm,
      na.rm = TRUE
    ),
    n = n()
  ) |>
  drop_na() |>
  ungroup()


ggplot(ideo_like_by_year,
       aes(x = year,
           y = mean_same_ideo_therm,
           color = ideology)) +
  geom_line(linewidth = 1) +
  geom_point() +
  theme_minimal() +
  labs(
    title = "Feelings Toward the Same Ideological Group",
    x = "Year",
    y = "Average Feelings (0-100) Toward the Same Ideology",
    color = "Ideological Identification"
  ) +
  scale_y_continuous(limits = c(0, 100)) +
  scale_color_manual(values = c("Liberal" = "#52BAF2", "Conservative" = "#F25252"))

# party dislike of "opposing" ideology group

anes_party_ideo_dislike <- party_dislike |>
  mutate(
    opposing_party_ideo_therm = case_when(
      party_id == "Republican" ~ lib_therm,
      party_id == "Democrat" ~ cons_therm,
      TRUE ~ NA_real_
    )
  )

party_ideo_dislike_by_year <- anes_party_ideo_dislike |>
  group_by(year, party_id) |>
  summarize(
    mean_opposing_party_ideo_therm = mean(
      opposing_party_ideo_therm,
      na.rm = TRUE
    ),
    n = n()
  ) |>
  drop_na() |>
  ungroup()


ggplot(party_ideo_dislike_by_year,
       aes(x = year,
           y = mean_opposing_party_ideo_therm,
           color = party_id)) +
  geom_line(linewidth = 1) +
  geom_point() +
  theme_minimal() +
  labs(
    title = "Party Feelings Toward the 'Opposing' Ideological Group",
    x = "Year",
    y = "Average Feelings (0-100) Toward the Opposing Ideology",
    color = "Party Identification"
  ) +
  scale_y_continuous(limits = c(0, 100)) +
  scale_color_manual(values = c("Democrat" = "#1717D4", "Republican" = "#DB1A1A"))

# party like of "same" ideology group

anes_party_ideo_like <- party_dislike |>
  mutate(
    same_party_ideo_therm = case_when(
      party_id == "Republican" ~ cons_therm,
      party_id == "Democrat" ~ lib_therm,
      TRUE ~ NA_real_
    )
  )

party_ideo_like_by_year <- anes_party_ideo_like |>
  group_by(year, party_id) |>
  summarize(
    mean_same_party_ideo_therm = mean(
      same_party_ideo_therm,
      na.rm = TRUE
    ),
    n = n()
  ) |>
  drop_na() |>
  ungroup()


ggplot(party_ideo_like_by_year,
       aes(x = year,
           y = mean_same_party_ideo_therm,
           color = party_id)) +
  geom_line(linewidth = 1) +
  geom_point() +
  theme_minimal() +
  labs(
    title = "Party Feelings Toward the 'Same' Ideological Group",
    x = "Year",
    y = "Average Feelings (0-100) Toward the Same Ideology",
    color = "Party Identification"
  ) +
  scale_y_continuous(limits = c(0, 100)) +
  scale_color_manual(values = c("Democrat" = "#1717D4", "Republican" = "#DB1A1A"))

# ideology dislike of "opposing" party

anes_ideo_party_dislike <- party_dislike |>
  mutate(
    opposing_ideo_party_therm = case_when(
      ideology == "Conservative" ~ dem_therm,
      ideology == "Liberal" ~ rep_therm,
      TRUE ~ NA_real_
    )
  )

ideo_party_dislike_by_year <- anes_ideo_party_dislike |>
  group_by(year, ideology) |>
  summarize(
    mean_opposing_ideo_party_therm = mean(
      opposing_ideo_party_therm,
      na.rm = TRUE
    ),
    n = n()
  ) |>
  drop_na() |>
  ungroup()


ggplot(ideo_party_dislike_by_year,
       aes(x = year,
           y = mean_opposing_ideo_party_therm,
           color = ideology)) +
  geom_line(linewidth = 1) +
  geom_point() +
  theme_minimal() +
  labs(
    title = "Ideological Feelings Toward the 'Opposing' Party",
    x = "Year",
    y = "Average Feelings (0-100) Toward the Opposing Party",
    color = "Ideology"
  ) +
  scale_y_continuous(limits = c(0, 100)) +
  scale_color_manual(values = c("Liberal" = "#52BAF2", "Conservative" = "#F25252"))


# ideology like of "same" party

anes_ideo_party_like <- party_dislike |>
  mutate(
    same_ideo_party_therm = case_when(
      ideology == "Conservative" ~ rep_therm,
      ideology == "Liberal" ~ dem_therm,
      TRUE ~ NA_real_
    )
  )

ideo_party_like_by_year <- anes_ideo_party_like |>
  group_by(year, ideology) |>
  summarize(
    mean_same_ideo_party_therm = mean(
      same_ideo_party_therm,
      na.rm = TRUE
    ),
    n = n()
  ) |>
  drop_na() |>
  ungroup()


ggplot(ideo_party_like_by_year,
       aes(x = year,
           y = mean_same_ideo_party_therm,
           color = ideology)) +
  geom_line(linewidth = 1) +
  geom_point() +
  theme_minimal() +
  labs(
    title = "Ideological Feelings Toward the 'Same' Party",
    x = "Year",
    y = "Average Feelings (0-100) Toward the Same Party",
    color = "Ideology"
  ) +
  scale_y_continuous(limits = c(0, 100)) +
  scale_color_manual(values = c("Liberal" = "#52BAF2", "Conservative" = "#F25252"))

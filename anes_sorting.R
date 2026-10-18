library(tidyverse)
library(haven)
library(here)

sorting <- read_csv("sorting.csv")

sorting |>
  count(party, ideology_group)

party_ideology <- sorting |>
  drop_na(party, ideology_group, weight) |>
  group_by(year, party, ideology_group) |>
  summarise(
    weighted_n = sum(weight),
    .groups = "drop"
  ) |>
  group_by(year, party) |>
  mutate(
    proportion = weighted_n / sum(weighted_n)
  ) |>
  ungroup()

# Plot 1

ggplot(
  party_ideology,
  aes(
    x = year,
    y = proportion,
    color = ideology_group
  )
) +
  geom_line(linewidth = 1) +
  geom_point() +
  facet_wrap(~party) +
  scale_y_continuous(
    labels = scales::percent
  ) +
  labs(
    title = "Ideological Composition of Democrats and Republicans Over Time",
    subtitle = "ANES Cumulative Time Series, 1972–2024",
    x = "Election Year",
    y = "Weighted Percentage",
    color = "Ideology",
    caption = "Source: ANES Cumulative Time Series. Weighted using VCF0009z."
  ) +
  theme_minimal()


cross_pressure <- sorting |>
  drop_na(party, ideology_group, weight) |>
  mutate(
    cross_pressured = case_when(
      party == "Democrat" &
        ideology_group == "Conservative" ~ 1,
      
      party == "Republican" &
        ideology_group == "Liberal" ~ 1,
      
      .default = 0
    )
  ) |>
  group_by(year, party) |>
  summarise(
    proportion = weighted.mean(
      cross_pressured,
      weight
    ),
    .groups = "drop"
  )

ggplot(
  cross_pressure,
  aes(
    x = year,
    y = proportion,
    color = party
  )
) +
  geom_line(linewidth = 1) +
  geom_point() +
  scale_y_continuous(
    labels = scales::percent
  ) +
  labs(
    title = "Liberal Republicans and Conservative Democrats Have Become Less Common",
    x = "Election Year",
    y = "Weighted Percentage Within Party",
    color = "Party",
    caption = "Source: ANES Cumulative Time Series. Weighted using VCF0009z."
  ) +
  theme_minimal()

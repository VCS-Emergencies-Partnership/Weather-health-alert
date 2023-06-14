# Load libraries
library(readxl)
library(tidyverse)
library(geographr)
library(demographr)
library(sf)
library(ggplot2)
source("r/themes.R")

# Load data
warnings <- readxl::read_xlsx("data/heat_health_alerts.xlsx")

# Clean data
warnings_clean <- warnings |> 
  pivot_longer(cols = 6:14,
               names_to = "area",
               values_to = "alert") |> 
  drop_na(alert) |> 
  mutate(alert_level = str_to_title(alert_level)) |> 
  left_join(geographr::boundaries_region21, by=c("area" = "region21_name")) |>  # using old 2021 region file as map is going to be small so do not need updated 2022 shapes
  st_as_sf()
  
# Create maps
# Alert 1
warnings_clean |>
  filter(alert_number == "1") |> 
  ggplot() +
  geom_sf(aes(fill = alert_level))  +
  labs(
    title = "Heat-Health Alert 1",
    subtitle = "9th June to 12th June",
    caption = "Source: UKHSA / Met Office"
  ) +
  scale_fill_manual(values = c("Red" = "#CC0033", "Amber" = "#FF9900", "Yellow" = "#FFE923", "Green" = "white")) +
  theme_map() 

# Save output
ggsave("outputs/heat_alert_1.png", width = 170, height = 200, units = "mm")

# Alert 2
warnings_clean |>
  filter(alert_number == "2") |> 
  ggplot() +
  geom_sf(aes(fill = alert_level))  +
  labs(
    title = "Heat-Health Alert 2",
    subtitle = "9th June to 12th June",
    caption = "Source: UKHSA / Met Office"
  ) +
  scale_fill_manual(values = c("Red" = "#CC0033", "Amber" = "#FF9900", "Yellow" = "#FFE923", "Green" = "white")) +
  theme_map() 

# Save output
ggsave("outputs/heat_alert_2.png", width = 170, height = 200, units = "mm")

# Alert 3
warnings_clean |>
  filter(alert_number == "3") |> 
  ggplot() +
  geom_sf(aes(fill = alert_level))  +
  labs(
    title = "Heat-Health Alert 3",
    subtitle = "9th June to 13th June",
    caption = "Source: UKHSA / Met Office"
  ) +
  scale_fill_manual(values = c("Red" = "#CC0033", "Amber" = "#FF9900", "Yellow" = "#FFE923", "Green" = "white")) +
  theme_map() 

# Save output
ggsave("outputs/heat_alert_3.png", width = 170, height = 200, units = "mm")

# Alert 1
warnings_clean |>
  filter(alert_number == "4") |> 
  ggplot() +
  geom_sf(aes(fill = alert_level))  +
  labs(
    title = "Heat-Health Alert 4",
    subtitle = "13th June to 19th June",
    caption = "Source: UKHSA / Met Office"
  ) +
  scale_fill_manual(values = c("Red" = "#CC0033", "Amber" = "#FF9900", "Yellow" = "#FFE923", "Green" = "white")) +
  theme_map() 

# Save output
ggsave("outputs/heat_alert_4.png", width = 170, height = 200, units = "mm")

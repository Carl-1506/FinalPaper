#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(openxlsx)
library(readxl)

# Load the democracy dataset
democracy_data <- read_csv("data/raw_data/Democracy_index.csv")

# Rename 'Entity' column to 'Country'
democracy_data <- democracy_data %>%
  rename(Country = Entity)

# Filter for entries from the year 2022
democracy_data <- democracy_data[democracy_data$Year == 2022, ]

# load the Gini Index data

gini_data <- read.csv("data/raw_data/Gini.csv")
# Rename columns using base R
colnames(gini_data) <- c("Country", "Gini_Index")

# load IHDI and Happiness score
IHDI_data <- read.xlsx("data/raw_data/IHDI.xlsx")


happiness_data <- read.csv("data/raw_data/Happiness_score.csv")

# merge all datasets
# Merging all datasets by "Country"
combined_data <- democracy_data %>%
  left_join(gini_data, by = "Country") %>%
  left_join(IHDI_data, by = "Country") %>%
  left_join(happiness_data, by = "Country")

# drop NA values
cleaned_data <- na.omit(combined_data)

#### Save data ####
write_csv(cleaned_data, "~/Downloads/STAT/data/analysis_data/analysis_data.csv")

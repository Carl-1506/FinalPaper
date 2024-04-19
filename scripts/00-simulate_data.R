#### Preamble ####
# Purpose: Simulates and tests data
# Author: Carl Fernandes
# Date: 18 April 2024
# Contact: carl.fernandes@mail.utoronto.ca

#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(testthat)

# Set seed for reproducibility
set.seed(123)

# Generate data
data <- data_frame(
  Country_Code = sample(sprintf("CC%03d", 1:300), 100, replace = TRUE),
  Year = 2022,
  Democracy_index = runif(100, 1, 10),  
  Gini_Index = runif(100, 20, 65),      
  Happiness_score = runif(100, 0, 10),  
  IHDI = runif(100, 0, 1)               
)

# Print the first few rows of the dataset
print(head(data))

library(testthat)
library(dplyr)

# Assuming 'data' is the dataset you previously created

# Test to ensure the dataset has the correct number of rows
test_that("Data has correct number of entries", {
  expect_equal(nrow(data), 100)
})

# Test to ensure all necessary columns exist
test_that("Data has all required columns", {
  required_columns <- c("Country_Code", "Year", "Democracy_index", "Gini_Index", "Happiness_score", "IHDI")
  expect_true(all(required_columns %in% names(data)))
})

# Test to check the range of Democracy_index
test_that("Democracy index is within the valid range", {
  expect_true(all(data$Democracy_index >= 1 & data$Democracy_index <= 10))
})

# Test to check the range of Gini_Index
test_that("Gini Index is within the valid range", {
  expect_true(all(data$Gini_Index >= 20 & data$Gini_Index <= 65))
})

# Test to check the range of Happiness_score
test_that("Happiness score is within the valid range", {
  expect_true(all(data$Happiness_score >= 0 & data$Happiness_score <= 10))
})

# Test to check the range of IHDI
test_that("IHDI is within the valid range", {
  expect_true(all(data$IHDI >= 0 & data$IHDI <= 1))
})

# Run tests
test_dir("tests/")



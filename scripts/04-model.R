#### Preamble ####
# Purpose: Model
# Author: Carl Fernandes
# Date: 17 April 2024
# Contact: carl.fernandes@mail.utoronto.ca



#### Workspace setup ####
library(tidyverse)
library(rstanarm)


#### Read data ####
analysis_data <- read_csv("data/analysis_data/analysis_data.csv")

analysis_data$Country <- as.factor(analysis_data$Country)
analysis_data$Gini_Index <- as.numeric(analysis_data$Gini_Index)
analysis_data$IHDI <- as.numeric(analysis_data$IHDI)

# first model
first_model <- lm(Happiness_score ~ Gini_Index, data = analysis_data)

# Check the summary of the model to see the coefficients and statistics
summary(first_model)


#second_model
second_model <- lm(Happiness_score ~ Democracy_index + Gini_Index + IHDI, data = analysis_data)

# Check the summary of the model
summary(second_model)

# Optional: Diagnostic plots to check for assumptions
# If you have a large number of countries, these plots may be less informative
par(mfrow = c(2, 2))
plot(second_model)


#### Save model ####
saveRDS(
  first_model,
  file = "models/first_model.rds"
)

saveRDS(
  second_model,
  file = "models/second_model.rds"
)

##### Michael Ramsey #####
# Lab 4 Exercises
# Solutions
# 02/06/2019

##### Exercise 1 #####

# Load libraries
library(tidyverse)

# Load data
data("diamonds")

##### Exercise 2 #####

# View the first few rows of data
head(diamonds)

# View all the data
View(diamonds)

# Structure of the data
str(diamonds)

##### Exercise 3 #####

# Bar plot of cut class, grouped by clarity
ggplot(data = diamonds, aes(x = cut, fill = as.factor(clarity))) + 
  geom_bar(position = 'dodge')

##### Exercise 4 #####

# Subset diamond data by 'ideal' cut
df <- diamonds %>%
  filter((cut == 'Ideal') & (clarity %in% c('SI1','SI2')))

##### Exercise 5 #####

# Subset diamond data by 'ideal' cut, select carat column
df <- diamonds %>%
  filter((cut == 'Ideal') & (clarity %in% c('SI1','SI2'))) %>%
  select(carat)

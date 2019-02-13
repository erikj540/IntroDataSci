##### Erik Johnson #####
# Lab 5 Exercises
# Solutions
# 02/13/2019

##### Load and Explore data ####
# Install package
install.packages('DALEX2')

# Load packages
library(DALEX2)
library(tidyverse)

# View data
data(dragons)

View(dragons)
as.tibble(dragons)


##### Exercise 1 #####
(most_scars <- dragons %>%
  arrange(desc(scars)) %>%
  as.tibble() %>%
  top_n(5) %>%
  select(year_of_birth, scars, colour, number_of_lost_teeth))

##### Exercise 2 #####
(gt_20_scars_by_color <- dragons %>% 
   filter(scars>20) %>% group_by(colour) %>%  summarize(n=n()) %>% mutate(freq = n /sum(n)))
  

##### Exercise 3 #####
(ave_lost_teeth_by_color <- dragons %>% group_by(colour) %>% summarize(aveLostTeeth = mean(number_of_lost_teeth, na.rm=TRUE)))



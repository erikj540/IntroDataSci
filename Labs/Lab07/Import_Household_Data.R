##### Michael Ramsey ######
# Lab 7 
# Data Import Walkthrough
# Date Created: 2/26/19
# Last Edited: 2/26/19

# Load necessary libraries
library(tidyverse)
library(data.table)

##### Loading data with read.table #####
# https://www.rdocumentation.org/packages/utils/versions/3.5.2/topics/read.table

##### Trial 1 #####
data1 <- read.table('household_power_consumption.txt')  # Filename

##### Trial 2 #####
data2 <- read.table('household_power_consumption.txt',  # Filename
                   sep=";")                             # Seperator
str(data2)

##### Trial 3 #####
data3 <- read.table('household_power_consumption.txt',  # Filename
                   sep=";",                             # Seperator
                   header = T)                          # Header
str(data3)

##### Trial 4 #####
data4 <- read.table('household_power_consumption.txt',  # Filename
                   sep=";",                             # Seperator
                   header = T,                          # Header
                   na.strings = c("NA","", "?"))        # Choose NA characters
str(data4)

##### Trial 5 #####
data5 <- read.table('household_power_consumption.txt',  # Filename
                    sep=";",                            # Seperator
                    header = T,                         # Header
                    na.strings = c("NA","", "?"),       # Choose NA characters
                    stringsAsFactors=FALSE)             # Prevent factor conversion
str(data5)


##### Loading data with fread #####
# https://www.rdocumentation.org/packages/data.table/versions/1.12.0/topics/fread

##### Trial 1 #####
data <- fread('household_power_consumption.txt')        # Filename 
str(data)

##### Trial 2 #####
data <- fread('household_power_consumption.txt',        # Filename 
              na.strings = c("NA","", "?"))             # Choose NA characters
str(data)

# Change columns
library(lubridate)

# Create year, month, day column
data <- data %>%
  mutate(Year = year())
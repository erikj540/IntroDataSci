library(tidyverse)
library(modelr)
library(stats)
load("dragons.RData")
head(dragons)

ggplot(data=dragons, aes(x = bodyLength, y = testScore)) +
  geom_point()

mod1 <- lm(testScore ~ bodyLength, data=dragons)
coef(mod1)

grid <- dragons %>%
  data_grid(bodyLength)

grid <- grid %>%
  add_predictions(mod1)

ggplot(data=dragons, aes(x=bodyLength)) +
  geom_point(aes(y = testScore)) +
  geom_line(aes(y = pred), data = grid, colour = "red", size = 1)

dragons <- dragons %>%
  add_residuals(mod1)

ggplot(data=dragons, aes(x=bodyLength, y=resid)) + 
  geom_ref_line(h = 0) +
  geom_point()

ggplot(data=dragons, aes(x=mountainRange, y=testScore)) +
  geom_boxplot()

ggplot(data=dragons, aes(x=bodyLength, y=testScore)) + 
  geom_point() + 
  facet_wrap(~ mountainRange)

ggplot(dragons, aes(x = bodyLength, y = testScore, colour = mountainRange)) +
  geom_point(size = 2)

by_mtnRange <- dragons %>%
  group_by(mountainRange) %>%
  nest()

mtnRange_model <- function(df) {
  lm(testScore ~ bodyLength, data = df)
}

  
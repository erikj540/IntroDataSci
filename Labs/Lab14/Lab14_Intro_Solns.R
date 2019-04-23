library(tidyverse)
library(modelr)
load("dragons.RData")


ggplot(dragons, aes(x = bodyLength, y = testScore, colour = mountainRange)) +
  geom_point(size = 2)

lm(testScore ~ mountainRange*bodyLength, data=dragons)

by_mtnRange <- dragons %>%
  group_by(mountainRange) %>%
  nest()

mtnRange_model <- function(df) {
  lm(testScore ~ bodyLength, data = df)
}

make_pred <- function(df) {
  data_grid(bodyLength)
}
by_mtnRange <- by_mtnRange %>% 
  mutate(model = map(data, mtnRange_model)) %>%
  # mutate(pred = map(model, predict))
  
  add_predictions
  mutate(pred = map(model))

grid(by_mtnRange$data[[1]]$bodyLength)
predict(by_mtnRange$model)
residby_mtnRange$model[[1]]
add_predictions(by_mtnRange$model[[1]]
tmp <- by_mtnRange %>%
  mutate(pred = map(model, predict))
tmp <- by_mtnRange %>%
  data_grid(by_mt)

data_grid(by_mtnRange$data[[1]], bodyLength)
ggplot(dragons, aes(bodyLength, testScore, colour = )) + 
  geom_point() + 
  facet_grid(model ~ x2)
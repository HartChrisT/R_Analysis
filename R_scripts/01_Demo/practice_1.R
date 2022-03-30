library(jsonlite)
demo_table <- read.csv(file='demo.csv', check.names = F, stringsAsFactors = F)
demo_table_2 <- fromJSON(txt =  'demo.json')
sample(c("cow", "deer", "pig", "chicken", "duck", "sheep", "dog"), 4)

num_rows <- 1:nrow(demo_table)
sample_rows <- sample(num_rows,3)
demo_table[sample_rows,]
library(tidyverse)

library(magrittr) # needs to be run every time you start R and want to use %>%
library(dplyr)    # alternatively, this also loads %>%

demo_table <- demo_table %>% mutate(Mileage_per_Year=Total_Miles/(2020-Year),IsActive=TRUE)
summarize_demo <- demo_table_2 %>% 
  group_by(condition) %>% 
  summarize(Mean_Mileage=mean(odometer), .groups = 'keep')
# %>% is a group operator that allows you to add another function on a 
# different line

summarize_demo <- demo_table_2 %>%
  group_by(condition) %>%
  summarise(Mean_Mileage=mean(odometer),Maximum_Price=max(price),Num_Vehicles=n(), .groups='keep')
# Creates a summary table with multiple columns
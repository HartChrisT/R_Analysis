demo_table3 <- read.csv('demo2.csv',check.names =F, stringsAsFactors=F)
library(magrittr) # needs to be run every time you start R and want to use %>%
library(dplyr)    # alternatively, this also loads %>%
long_table <- gather(demo_table3,key="Metric",value="Score",buying_price:popularity)
# This function takes the list denoted by : and stacks those rows to make the data longer

# spread the table back to its original form
wide_table <- long_table %>% spread(key='Metric', value='Score')

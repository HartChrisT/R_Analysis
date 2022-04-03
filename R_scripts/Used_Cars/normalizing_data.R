population_table <- read.csv('used_car_data.csv',check.names=F,stringsAsFactors = F)

plt <- ggplot(population_table,aes(x=log10(Miles_Driven))) #import dataset into ggplot2
plt + geom_density() #visualize the distribution using density plot ie(Stdev)

sample_table <- population_table %>%
  sample_n(50) # n=50

plt <- ggplot(sample_table,aes(x=log10(Miles_Driven))) #import dataset into ggplt
plt + geom_density() #visualize distribution of sample

t.test(log10(sample_table$Miles_Driven),mu=mean(log10(population_table$Miles_Driven)))
# Compare sample versus population means (t-test)


#This generates two random samples n=50 from the population table
sample_table <- population_table %>% sample_n(50) #generate 50 randomly sampled data points
sample_table2 <- population_table %>% sample_n(50) #generate another 50 randomly sampled data points

t.test(log10(sample_table$Miles_Driven),mu=mean(log10(sample_table2$Miles_Driven)))
# Compare sample versus population means (t-test)
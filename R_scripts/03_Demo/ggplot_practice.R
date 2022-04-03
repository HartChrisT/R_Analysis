plt <- ggplot(mpg,aes(x=class)) #import dataset into ggplot2
plt + geom_bar() #plot a bar plot

mpg_summary <- mpg %>% 
  group_by(manufacturer) %>%
  summarize(Vehicle_Count=n(), .groups = 'keep') # Create a summary table
plt <- ggplot(mpg_summary,aes(x=manufacturer,y=Vehicle_Count))
# import dataset into ggplot2
plt +geom_col() #Plot a bar plot

plt + geom_col() + xlab("Manufacturing Company") + ylab("Number of Vehicles in Dataset") + #plot a boxplot with labels
theme(axis.text.x=element_text(angle=45,hjust=1)) #rotate the x-axis label 45 degrees
# YOU MUST ADD A + SIGN TO ADD THE THEME TO THE PLOT

mpg_summary <- subset(mpg,manufacturer=='toyota') %>%
  group_by(cyl) %>%
  summarise(Mean_Hwy=mean(hwy), .groups='keep')
  # create summary table

plt <- ggplot(mpg_summary,aes(x=cyl,y=Mean_Hwy))
# import dataset into ggplot

plt + geom_line() + 
  scale_x_discrete(limits=c(4,6,8)) + 
  scale_y_continuous(breaks = c(15:30))
# add line plot with labels

plt <- ggplot(mpg,aes(x=displ,y=cty,color=class,shape=drv,size=cty))
# import dataset into ggplot2

plt + geom_point() + 
  labs(x="engine Size (L)",y="City Fuel_efficiency (MPG)",color="Vehicle Class", shape="Type of Drive",size="city mpg")

plt <- ggplot(mpg,aes(x=manufacturer, y=hwy,colour=manufacturer)) #import dataset into ggplot2
plt + geom_boxplot() +
  theme(axis.text.x=element_text(angle=45,hjust=1))

mpg_summary <- mpg %>%
  group_by(manufacturer,year) %>%
  summarize(Mean_Hwy=mean(hwy),.groups ='keep')

plt <- ggplot(mpg_summary,aes(x=manufacturer,y=factor(year),fill=Mean_Hwy))

plt + geom_tile() + labs(x="Manufacturer", y="Vehicle Year", fill="Mean Highway(MPG)") +
  theme(axis.text.x=element_text(angle=90,hjust=.75))

cars <- head(mtcars) # Adding head to environment

ggplot(mtcars,aes(x=wt)) + geom_density() #visualize distribution using density plot

shapiro.test(mtcars$wt)



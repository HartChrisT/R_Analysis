mpg_modified <- read.csv('mpg_modified.csv') #Import dataset
mpg_1999 <- mpg_modified %>%
  filter(year==1999) #select only data where the year is 1999
mpg_2008 <- mpg_modified %>%
  filter(year==2008) #select 2008 data

t.test(mpg_1999$hwy, mpg_2008$hwy, paired = T) # compare 2 samples dif

head(mtcars)

mtcars_filt <- mtcars[,c("hp", "cyl")] #filter columns from mtcars dataset
mtcars_filt$cyl <- factor(mtcars_filt$cyl) #convert numeric column to factor

aov(hp ~ cyl,data=mtcars_filt) #compare the means across multiple levels

summary(aov(formula = hp ~ cyl, data = mtcars_filt))

plt <- ggplot(mtcars,aes(x=hp, y=qsec))
plt + geom_point() #create scatter plot

cor(mtcars$hp,mtcars$qsec) #calculate correlation coefficient
used_cars <- read.csv('../Used_Cars/used_car_data.csv',stringsAsFactors = F)
# read in dataset
head(used_cars)

plt <- ggplot(used_cars, aes(x=Miles_Driven, y=Selling_Price))
plt + geom_point()

cor(used_cars$Miles_Driven,used_cars$Selling_Price)

used_matrix <- as.matrix(used_cars[,c("Selling_Price","Present_Price","Miles_Driven")]) 
# Convert DataFrame into numeric matrix
cor(used_matrix)

lm(qsec ~ hp,mtcars) #create a linear model

summary(lm(qsec ~ hp,mtcars))

model <- lm(qsec ~ hp,mtcars) #create linear model
# gets coefficients data to plot

yvals <- model$coefficients['hp']*mtcars$hp + 
  model$coefficients['(Intercept)']
# Putting the model into Y=mx + b format

plt <- ggplot(mtcars,aes(x=hp,y=qsec)) #import dataset into ggplot2
plt + geom_point() + geom_line(aes(y=yvals), color = "red") 
#plot scatter plot and linear model

# Multiple linear regression
summary(lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars))

tbl <- table(mpg$class,mpg$year) # generate contingency table
chisq.test(tbl) #compare categorical distributions
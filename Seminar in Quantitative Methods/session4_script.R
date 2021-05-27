mtcars <- mtcars

library (expss)
mtcars <- apply_labels(mtcars,
                       mpg = "Miles/(US) gallon",
                       cyl = "Number of cylinders",
                       disp = "Displacement (cu.in.)",
                       hp = "Gross horsepower",
                       drat = "Rear axle ratio",
                       wt = "Weight (1000 lbs)",
                       qsec = "1/4 mile time",
                       vs = "Engine",
                       vs = c("V-engine" = 0,
                              "Straight engine" = 1),
                       am = "Transmission",
                       am = c("Automatic" = 0,
                              "Manual"=1),
                       gear = "Number of forward gears",
                       carb = "Number of carburetors")
mtcars

#number of carburators 

table (mtcars$carb)

mtcars$carb==4

#Frequency
sum(mtcars$carb==4)
#Proportion (relative frequencies)
sum(mtcars$carb==1)/nrow(mtcars)
#Proportion 
sum(mtcars$carb==1)/nrow(mtcars)*100

#Table

#create a table
table(mtcars$gear)
#proportions table
prop.table(table(mtcars$gear))
#Percentages table
prop.table(table(mtcars$gear))*100


GEARtable <- data.frame(prop.table(table(mtcars$gear))*100)
View (GEARtable)

names(GEARtable)[1] <- "#Gears"
View (GEARtable)

#Barplot (frequencies)
barplot(table(mtcars$gear))

#Barplot (relative frequencies)
barplot(prop.table(table(mtcars$gear)))

#Barplot (relative frequencies)
barplot(prop.table(table(mtcars$gear))*100)

#with ggplot2
library (ggplot2)

plot <- ggplot(mtcars) +
  aes(x = gear) +
  geom_bar()


#change appearence
barplot + theme( axis.line = element_line(colour = "darkgray", 
                                    size = 1, linetype = "solid")) 

barplot + theme( axis.line = element_line(colour = "darkgray", 
                                          size = 1, linetype = "solid")) + coord_flip()

barplot  +  geom_bar(fill="white", color="purple") 


ggplot(mtcars) +
  aes(x = cyl) +
  geom_bar(fill="pink") 

# change the limits of the y scale

ggplot(mtcars) +
  aes(x = cyl) +
  geom_bar(fill="pink") + ylim (0, 15)


# more on data visualization 
# visualize the distribution of certain variable
# Histogram 

#lets use a different dataset (	swiss - Swiss Fertility and Socioeconomic Indicators (1888) Data)

rm(list=ls())

data <- swiss
data

#Histogram 
hist(data$Fertility)

#with ggplot

ggplot(data) +
  aes(x = Fertility) +
  geom_histogram()

ggplot(data) +
  aes(x = Fertility) +
  geom_histogram(bins=7)

#density plot

plot(density(data$Infant.Mortality))

plot(density(data$Catholic))

ggplot(data) +
  aes(x = Catholic) +
  geom_density()

####Central tendency measures

summary (data$Fertility)

IQR (data$Fertility)


#####Boxplot


boxplot(data$Infant.Mortality)

boxplot(data$Education)

#recode education into below or above the mean

mean (data$Education)
data$Education2 <- ifelse(data$Education < 10.97872, "Below or equal", "Above")

ggplot(data) +
  aes(x = Education2, y = Fertility) +
  geom_boxplot()

#dispersion measures

var(data$Fertility)

sd(data$Fertility)




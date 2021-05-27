## METHODOLOGY & RESEARCH DESIGN: QUANTITATIVE METHODS
## Session 6: BIVARIATE STATISTIC II
## April 22, 2021


######################################################################
#                       MEAN COMPARISON
######################################################################

# install these packages 
install.packages("dplyr")
install.packages("tidyverse")
install.packages("descr")

# load these packages
library("foreign")
library("Rmisc")
library("dplyr")
library("tidyverse")
library("descr")

# as last week, we are going to use data from the Eurobarometer of September 2018
# the Eurobarometer file needs to be in your working directory
eurobar<- read.dta("eu.sep18.dta")
        
# let's look at the left-right variable
freq(eurobar$d1)
class(eurobar$d1)

# let's recode the left-right variable as numeric to use it in our example
eurobar$leftright<-as.numeric(eurobar$d1)
freq(eurobar$leftright)
eurobar$leftright<-na_if(eurobar$leftright, 11)
eurobar$leftright<-na_if(eurobar$leftright, 12)
freq(eurobar$leftright)


# what's the mean value of the left-right variable in the sample?
mean(eurobar$leftright, na.rm=TRUE)

# what's the mean value of the left-right variable for men adn women?
Table1<-aggregate(eurobar$leftright, list(eurobar$d10),FUN=mean, na.rm=TRUE)

# the t-test tells us if the difference between the sample means is statisticall different
t.test(eurobar$leftright~eurobar$d10,na.rm=TRUE)

# let's try with another variable defining the groups
t.test(eurobar$leftright~eurobar$qa17_2,na.rm=TRUE)



######################################################################
#                       CORRELATION
######################################################################

# let's use the mtcar dataset
cars <- mtcars

# as first step, let's plot the mile/gallon and the weight of the cars
plot(cars$mpg, cars$wt)

# let's plot the mile/gallon and the 1/4 mile time of the cars
plot(cars$mpg, cars$qsec)

# now, let's look at their correlation
cor(cars$mpg, cars$wt)
cor(cars$mpg, cars$qsec)


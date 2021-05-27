## METHODOLOGY & RESEARCH DESIGN: QUANTITATIVE METHODS
## Session 5: BIVARIATE STATISTIC I
## March 19, 2020


######################################################################
#    LET'S CALCULATE THE AVERAGE AGE OF THE PORTUGUESE POPULATION
######################################################################

# install these packages and load them 
install.packages("foreign")
install.packages("Rmisc")

library("foreign")
library("Rmisc")

# we are going to use data from the Eurobarometer of September 2018
# the Eurobarometer file needs to be in your working directory [getwd(), setwd()]
eurobar<- read.dta("eu.sep18.dta")
attach(eurobar)

# mean for the variable d11 (age) and mean+CI
mean(d11)
CI(d11)



######################################################################
#                  LET'S RUN A CROSS-TAB
##################################################################### 

# install this package and load it
install.packages("gmodels")
library("gmodels")

# run a cross-tab with gender (d10) and benefit from EU membership (qa16)
CrossTable(qa16, d10, format="SPSS", digit=1, prop.chisq =FALSE)

# run the same table with the chi-squared
CrossTable(qa16, d10, format="SPSS", digit=1, prop.chisq = FALSE,prop.r = FALSE, prop.t = FALSE, chisq= TRUE)

# run a cross-tab with gender (d10) and the importance of equality between men and women (qa14_1) + chi-squared
CrossTable(qa14_1, d10, format="SPSS", digit=1, prop.chisq = FALSE,prop.r = FALSE, prop.t = FALSE, chisq= TRUE)

## SEMINAR IN QUANTITATIVE METHODS IN THE SOCIAL SCIENCES
## Session 7: Linear regression 1
## April 29, 2021


######################################################################
                       LINEAR REGRESSION
######################################################################

# let's use the mtcar dataset
cars <- mtcars

# like you did last class, let's plot the mile/gallon and the weight of the cars
plot(cars$mpg, cars$wt)

# and look at their correlation
cor(cars$mpg, cars$wt)

# now we fit a linear model

mod1 <- lm(mpg~wt, data=cars)
mod1

## Model summary
summary(mod1) 

## Screenreg command in Texreg package

install.packages("texreg")
library(texreg)

screenreg(list(mod1))


######################################################################
#                       REGRESSION DIAGNOSTICS
######################################################################

## Attributes of result
names(mod1)

mod1$coefficients

## Function for accessing specific elements of result

coef(mod1)      # estimated coefficients
confint(mod1)   # confidence intervals for the parameters
vcov(mod1)      # estimated variance covariance matrix
deviance(mod1)  # residual sum of squares
resid(mod1)     # residuals
fitted(mod1)    # fitted values

#fitted values by residuals plot
plot(fitted(mod1), resid(mod1))

#histogram of residuals
hist (resid(mod1))

#regression plot with a regression line
plot(mpg~wt, data=cars, main="Regression Weight~MpG")
abline(mod1,lwd=2)

#Standard diagnostics plots to check the 4 criteria

par(mfrow=c(2,2)) #creates the 2 by 2 plots
plot(mod1)

par(mfrow=c(1,2)) #creates the 1 by 2 plots
plot(mod1,which=1:2)

par(mfrow=c(1,1)) #back to only 1 plot in the window
plot(mod1)

## SEMINAR IN QUANTITATIVE METHODS IN THE SOCIAL SCIENCES
## Session 8: Linear regression 2
## May 6, 2021


######################################################################
#                       MULTIPLE LINEAR REGRESSION
######################################################################

# let's use the mtcar dataset again
cars <- mtcars

# now we fit the same bivariate linear model as last time

mod1 <- lm(mpg~wt, data=cars)
mod1
summary(mod1) 

# and next, we try to include control variables - but which? All of them! 

mod2 <- lm(mpg~hp+cyl+disp+drat+wt+qsec+vs+am+gear+carb, data=cars)
summary (mod2)

# that was clearly a bad idea - let's try to be more theoretical

mod3 <- lm(mpg~wt+qsec, data=cars)
summary (mod3)

mod4 <- lm(mpg~wt+qsec+am, data=cars)
summary (mod4)

#compare model fit with an anova

anova(mod1, mod2)
anova(mod1, mod3)
anova(mod3, mod4)

## And again: screenreg command in texreg package

install.packages("texreg")
library(texreg)

screenreg(list(mod4))
screenreg(list(mod1, mod2, mod3, mod4))
screenreg(list(mod1, mod3, mod4))

#some more visualization, based on correlations

plot(cars[,c("mpg","wt","qsec","am")])

#And some more visualizations

install.packages("jtools")
library(jtools)

effect_plot(mod4, pred = wt, interval = TRUE, plot.points = TRUE)
effect_plot(mod4, pred = qsec, interval = TRUE, plot.points = TRUE)
effect_plot(mod4, pred = am, interval = TRUE, plot.points = TRUE)

plot_summs(mod4, scale = TRUE)
plot_summs(mod1, mod3, mod4, scale = TRUE)

plot_summs(mod4, scale = TRUE, plot.distributions = TRUE, inner_ci_level = .9)
plot_summs(mod1, mod3, mod4, scale = TRUE, plot.distributions = TRUE, inner_ci_level = .9)


######################################################################
#                       REGRESSION DIAGNOSTICS
######################################################################


#Standard diagnostics plots to check the 4 criteria

par(mfrow=c(2,2)) #creates the 2 by 2 plots
plot(mod4)

#Transform the IV to deal with non-normality

cars$mpg_log = log(cars$mpg)

cars$mpg2 = (cars$mpg)^2

#Robust standard errors

install.packages("sandwich")
library(sandwich)

summ(mod1, robust = TRUE)
summ(mod4, robust = TRUE)

#Delete outliers 

cooksd <- cooks.distance(mod4)
cooksd

influential <- cooksd > 0.3
influential
                          
cars2 <- cars[-influential, ]

#now you can run the models with the new dataset, cars2#


####some packages you might need if the commands don't work

install.packages("ggstance")
library(ggstance)

install.packages("broom")
library(broom)


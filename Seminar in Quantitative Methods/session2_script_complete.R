## SEMINAR IN QUANTITATIVE METHODS IN THE SOCIAL SCIENCES
## Session 2: Data management
## March 18, 2021

# Objects
3+5
example<-3+5 
example

example+12
example2<- 34
example3<- example + example2
example3

# Vectors
vector<- c(1,2,3,4,5,6)
vector
vector+7

teachers<- c("Lea", "Tiago", "Roberto")
teachers

# Matrices
matrix<- matrix(c(1,7,11,24,35,38), ncol=2)
matrix

vect1<- c(1,4,7,9,10)
vect2<-c(2,6,11,14,15)
matr<-cbind(vect1, vect2)
matr


# operation on the data frame
#let's use cars!
data <- mtcars
View(data)

# raname variables
names(data)
names(data)[1] <- 'consumption'
View(data)
names(data)[7] <- 'unknown'

# label variable values
data$am<-factor(data$am, 
                levels = c(0,1), 
                labels = c("automatic", "manual"))

data$cyl<-ordered(data$cyl,
                  levels = c(4,6,8),
                  labels = c("weak", "medium", "strong"))


## Example dataset: mtcars

data <-mtcars

## inspect dataset

summary(data)
head(data)
tail(data)

## recode variables: make a new variable based on 2 other variables

data$mpg
data$cyl

#sum
data$sum_mpg_cyl <- data$mpg + data$cyl
data$sum_mpg_cyl

#difference
data$dif_mpg_cyl <- data$mpg - data$cyl
data$dif_mpg_cyl

#mean
data$mean_mpg_cyl <- (data$mpg + data$cyl)/2
data$mean_mpg_cyl

#create new categories: high and low miles per gallon
data$mpg

data$mpg_cat <- ifelse(data$mpg > 20,
                       c("high"), c("low"))
data$mpg_cat

#create new categories: high, medium and low weight

data$wt

attach (data)
data$wt_cat[wt > 4] <- "high"
data$wt_cat[wt > 2 & wt <= 4] <- "medium"
data$wt_cat[wt <= 2] <- "low"
detach (data)

data$wt_cat

#use recode to make 2 out of 3 categories of cylinders

library(car)
data$cyl
data$cyl_rec <- recode(data$cyl, "4=1; c(6,8)=2")
data$cyl_rec


####3rd part ####Subset append and merge :)


rm(list = ls())


data(mtcars)
mtcars

#columns (variables) stuff
mtcars[,3]
data <- mtcars[,3]
class(data)
data <- data.frame(mtcars[,3])
class(data)
d <- mtcars[,3:4]

d <- mtcars[,c(3:5, 7)]

# subset by column name (keep selected columns)
colnames(mtcars)
df <- subset(mtcars, select = c(mpg,drat) )

# subset by column name (drop selected columns)

df <- subset(mtcars, select = -c(mpg,drat) )

#alternative create an object with the names of the variables that we want to keep
keep <- c("mpg","drat", "hp")
df <- subset(mtcars, select = keep )

###############################################################################
#subsetting observarions
#clean start :)
rm(list = ls())
data(mtcars)
mtcars
mtcars[1,]
first <- mtcars[1,]
#first 5 obs
firsthalf <- head(mtcars, 16)
secondhalf <- tail(mtcars, 16)
#random sample
randomSample <- mtcars[sample(nrow(mtcars), 5), ]
randomSample
randomSample <- mtcars[sample(nrow(mtcars), 5), ]
randomSample
set.seed(5)
randomSample <- mtcars[sample(nrow(mtcars), 5), ]
randomSample
randomSample <- mtcars[sample(nrow(mtcars), 5), ]
randomSample
set.seed(Sys.time())

###############################################################################
#Find a specific value
mtcars[3,7]
mtcars[3,"mpg"]

#subste data (only cars with Automatic gear)
Automatic <- mtcars[which(mtcars$am==1),]
#subste data (only cars with Manual gear)
Manual <- mtcars[which(mtcars$am!=1),]

###################################
rm(list = ls())
data(mtcars)
# append/bind rows/observations
firsthalf <- head(mtcars, 16)
secondhalf <- tail(mtcars, 16)
rm(mtcars)
mtcars <- rbind(secondhalf, firsthalf)
# append/bind columns/variables
twovariables <- subset(mtcars, select = c(mpg,drat) )
rest <- subset(mtcars, select = -c(mpg,drat) )
mtcars <- cbind(rest, twovariables)


################MERGE 
rm(list = ls())
data(mtcars)
part1 <- subset(mtcars, select = c(drat) )
part2 <- subset(mtcars, select = -c(drat) )
merged <- merge(part1, part2, by = "row.names")
#alternative (create id variable)
rm(list = ls())
data(mtcars)
mtcars$ID <- rownames(mtcars)
part1 <- subset(mtcars, select = c(ID,drat) )
part2 <- subset(mtcars, select = -c(drat) )
merged <- merge(part1, part2, by = "ID")

#####BONUS#############################################
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


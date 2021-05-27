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
mtcars[15,]
first <- mtcars[1,]
#first 5 obs
firsthalf <- head(mtcars, 16)
secondhalf <- tail(mtcars, 16)
#random sample
randomSample <- mtcars[sample(nrow(mtcars), 5), ]
randomSample
randomSample <- mtcars[sample(nrow(mtcars), 5), ]
randomSample
set.seed(6)
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

test <- mtcars[which(mtcars$carb>1 & mtcars$carb<5),]

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



for (row in 1:nrow(mtcars)){
  mtcars[row,"mean3"] <- mean(mtcars[row,1:2])
}

mtcars$mean2<-apply (mtcars[,1:2], 1, mean, rm.na=T)




#####################descriptive class 1



head(mtcars)
colnames(mtcars)
class(mtcars$carb)

unique(mtcars$carb)
mtcars$carb==4
sum(mtcars$carb==4)
sum(mtcars$carb==1)/nrow(mtcars)

table (mtcars$carb)
7/32
7/32*100

prop.table(table(mtcars$carb))
(prop.table(table(mtcars$carb)))*100


rm(list=ls())

vector <- c(2,4,4,5,6,7,8)
quantile(vector, type=1)
quantile(vector, 0.5)
median(vector, type = 1)
IQR(vector, type = 1)

quantile(mtcars$mpg)
IQR(mtcars$mpg)

############## quartiles

vector <- c(2,4,4,5,6,7,8)
quantile(vector, type=1)
quantile(vector, 0.5)
median(vector, type = 1)
IQR(vector, type = 1)

quantile(mtcars$mpg)
IQR(mtcars$mpg)
as.numeric(quantile(mtcars$mpg, 0.75) - quantile(mtcars$mpg, 0.25))


##################Mode and Mean
table(mtcars$gear)

unique(mtcars$gear)[which.max(tabulate(match(mtcars$gear, unique(mtcars$gear))))]

################### MEAN


dogsize <- c(600 ,470, 170 ,430, 300)
sum(dogsize)/5
mean(dogsize)

mean(mtcars$mpg)

###########Variance
mean <- mean(dogsize)
doglessmean <- dogsize - mean
squaredog <- doglessmean^2
sum(squaredog)
sum(squaredog)/(5-1)
variancedog <- sum(squaredog)/(5-1)

var(dogsize)






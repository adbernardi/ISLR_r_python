# Chapter 2 Applied Problem Set 
#8
# Reading the college data set into R 
# a 
college = read.csv("/Users/anthonybernardi/Desktop/College.csv")
# b
rownames(college) = college[,1]
rownames(college)
dim(college)
# Trying to remove the first column in the data where the names 
# are stored 
college = college[,-1]
rownames(college)
# c
# producing a numerical summary of the variables in the data set 
summary(college)
# producing a scatterplot matrix of the first ten columns 
pairs(college[,1:10])
# using the plot function to produce boxplots of oustate vs private 
# Need to use the attach function
attach(college)
# Need to make these variables factors I believe
Private = as.factor(Private)
plot(Private, Outstate)
# Creating new variable 'Elite' based on proportion of top10 perc share 
# Where top10perc exceeds 50
Elite = rep("No", nrow(college))
Elite[college$Top10perc > 50] = "Yes"
Elite = as.factor(Elite)
# Finally appending this back to our original data frame
college = data.frame(college, Elite)
# Looks like 78 colleges fit our criteria of elite 
# Producing a plot of oustate vs elite 
plot(Elite, Outstate)
# Making some histograms now 
# Doing some general EDA
par(mfrow=c(2,2))
hist(PhD, breaks=15)
hist(S.F.Ratio, breaks=15)
hist(Books, breaks=15)
hist(Grad.Rate, breaks=15)
?hist
# Let's take a crack at acceptance rate 
accept_rate = (Accept/Apps)
?round
accept_rate = round(accept_rate, digits = 2)
hist(accept_rate)
plot(Elite, accept_rate)
plot(accept_rate, main="Acceptance Rate")
?plot
identify(accept_rate)
# Checking out the schools with the lowest acceptance rate 
college[71,]
college[251,]
# Sure does make sense!
plot(accept_rate, Room.Board)
hist(accept_rate)
# Might be worth looking at enroll rate also 
enroll_rate = (Enroll/Accept)
enroll_rate = round(enroll_rate, digits = 2)
hist(enroll_rate)
plot(enroll_rate)
identify(enroll_rate)
# Which school has the highest conversion rate? Is it an elite school?
college[67,]
college[78,]
college[377,]
college[448,]
# none of these 4 are considered elite! wild 
college = data.frame(college, accept_rate)
college = data.frame(college, enroll_rate)
college[67,]
# Maybe try slicing the highest enroll rates and see what we get 
high_conversion = rep("no", nrow(college))
high_conversion[college$enroll_rate > 0.7] = "Yes"
high_conversion = as.factor(high_conversion)
hist(enroll_rate)
# What are the high conversion elite schools, if any?
summary(high_conversion)
college = data.frame(college, high_conversion)
table(Elite)
install.packages("tidyverse")
Yes
Yes

# Question 9!
# Loading in the auto data set 
Auto = read.csv("/Users/anthonybernardi/Desktop/Auto.csv", header = TRUE, na.strings = "?")
summary(Auto)
# Removing missing data from the auto data set 
Auto = na.omit(Auto)
dim(Auto)
colnames(Auto)
attach(Auto)
range(mpg)
range(displacement)
range(horsepower)
range(weight)
range(acceleration)
mean(mpg)
sd(mpg)
mean(displacement)
sd(displacement)
mean(horsepower)
sd(horsepower)
mean(weight)
sd(weight)
mean(acceleration)
sd(acceleration)
# Removing the 10th through 85th observations and then grabbing
# summary stats from that subset 
auto_subset = Auto[-10:-85,]
dim(auto_subset)
range(auto_subset$mpg)
mean(auto_subset$mpg)
sd(auto_subset$mpg)
range(auto_subset$displacement)
mean(auto_subset$displacement)
sd(auto_subset$displacement)
range(auto_subset$horsepower)
mean(auto_subset$horsepower)
sd(auto_subset$horsepower)
range(auto_subset$weight)
mean(auto_subset$weight)
sd(auto_subset$weight)
range(auto_subset$acceleration)
mean(auto_subset$acceleration)
sd(auto_subset$acceleration)

# trying a function to speed it up 
# no dice 

mean_df <- function(col, df) {
  mean <- mean(df$col)
  return (mean)  
}

mean_df(auto_subset$displacement, auto_subset)
# Trying a for loop 
quant_cols <- c(auto_subset$mpg, auto_subset$displacement, auto_subset$horsepower, auto_subset$weight, auto_subset$acceleration)
for (i in quant_cols) {
  print(mean(i))
}


str(auto_subset)
savehistory()
loadhistory()

# Investigating some of the predictors graphically and seeing what we get 
# Looking at our vars 
colnames(Auto)
# Scatter plots 
plot(mpg, displacement)
pairs(Auto)
cylinders = as.factor(cylinders)
Auto = data.frame(Auto, cylinders)
plot(mpg, cylinders)
pairs(~ cylinders + mpg + horsepower)
plot(mpg, horsepower)
plot(mpg, weight)
plot(mpg, acceleration)
plot(mpg, year)
plot(mpg, cylinders)

# Question 10
# Grabbing the Boston data set 
library(MASS)
Boston
colnames(Boston)
?Boston
dim(Boston)
Boston[1:3,]
# Making some pairwise scatterplots of the predictors 
pairs(Boston)
attach(Boston)
pairs(~ crim + age + tax)
pairs(~ black + indus + chas)
str(Boston)
?Boston
pairs(~ tax + age + rad + chas)
plot(tax, chas)
plot(tax, age)
plot(tax, ptratio)
plot(tax, rad)
?Boston
plot(tax, zn)
plot(tax, crim)
# Determining if anythign is predictive of crime rate 
colnames(Boston)
plot(zn, crim)
plot(tax, crim)
plot(~ crim + zn + indus + chas+ nox + rm)
plot(rm, crim)
plot(~ crim + age + dis + rad + tax + ptratio + black + lstat + medv)
# Look further into age, dis, black, lstat, and medv
plot(age, crim)
plot(dis, crim)
plot(black, crim)
# Maybe a slight positive relationship and then neg, respectively, for these last two 
plot(lstat, crim)
plot(medv, crim)
?Boston
# Looking if any of the towns have a high crime rate,
# high tax rate, or high pupil-teacher ratios 
# Looking at the ranges for each 
range(crim)
fivenum(crim)
range(tax)
fivenum(tax)
mean(tax)
range(ptratio)
fivenum(ptratio)
mean(ptratio)
# Suburbs bound to the charles river 
colnames(Boston)
table(chas)
# which suburb has the lowest median value of owner occupied homes?
fivenum(medv)
median(medv)
# Finding which record has the lowest value 
Boston[which(medv == min(medv)), ]
dim(Boston)
mean(tax)
mean(ptratio)
# Finding the distribution of rooms per dwelling
fivenum(rm)
rm_rounded = round(rm, 0)
table(rm_rounded)
# focusing on the 8+ rooms per dwelling group 
eight_plus = Boston[round(rm,0) >= 8, ]
dim(eight_plus)
summary(eight_plus)
summary(Boston)
eight_plus_new = Boston[rm >= 8, ]
summary(eight_plus_new)
seven_plus_new = Boston[rm >= 7, ]
pairs(eight_plus_new)
# Some descriptive stats 
# Comparing the dwellings above 8 rooms on average to the population 
# Seems like affluence is the common factor based on group median & spread differences
# Might be worth looking more into spread variables to strengthen our claim 
summary(eight_plus_new$crim)
fivenum(eight_plus_new$crim)
summary(eight_plus_new$tax)
summary(eight_plus_new$medv)
summary(medv)
summary(eight_plus_new$ptratio)
summary(ptratio)

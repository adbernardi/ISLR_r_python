# Intro to Statistical Learning - Ch 2 
# Lab: Introduction to R Code 
# Establishing that R is function-based 
x <- c(1,3,2,5)
x
?matrix
# Creating a simple matrix 
x = matrix(data=c(1, 2, 3, 4), nrow=2, ncol=2)
x
# Using byrow 
y = matrix(data=c(1, 2, 3, 4), nrow=2, ncol=2, byrow=TRUE)
y
sqrt(y)
y^2
# Using the rnorm() and cor() functions
x = rnorm(50)
x
y = x+rnorm(50, mean=50, sd=.1)
cor(x,y)
?plot
x=rnorm(100)
y=rnorm(100)
plot(x, y)
plot(x, y, xlab="this is the x-axis", ylab="this is the y-axis", main="Plot of X vs Y")
# creating and saving a plot 
pdf("Figure.pdf")
plot(x, y, col='green')
dev.off()
x = seq(-pi, pi, length = 50)
x
?contour
y=x
y
f = outer(x, y, function(x,y)cos(y)/(1+x^2))
contour(x, y, f)
# Adding in some customization
contour(x, y, f, nlevels=45, add=T)
fa = (f-t(f))/2
contour(x, y, fa, nlevels=15)
# Messing around with image and other 3d plots 
image(x, y, fa)
persp(x, y, fa)
# theta and phi seem to be the viewing angles 
persp(x, y, fa, theta=30)
persp(x, y, fa, theta=30, phi=20)
persp(x, y, fa, theta=30, phi=70)
persp(x, y, fa, theta=30, phi=40)
# Reading in the Auto dataset from the website
Auto = read.csv("/Users/anthonybernardi/Desktop/Auto.csv", header= TRUE, na.strings = "?")
dim(Auto)
# Throwing out missing data cases
Auto_clean = na.omit(Auto)
dim(Auto_clean)
names(Auto)
attach(Auto)
plot(cylinders, mpg)
# Making cylinders a categorical var 
cylinders = as.factor(cylinders)
plot(cylinders, mpg)
# Customizing what's now a boxplot 
plot(cylinders, mpg, col="red")
plot(cylinders, mpg, col="red", varwidth=T)
plot(cylinders, mpg, col="red", varwidth=T, horizontal=T)
plot(cylinders, mpg, col="red", varwidth=T, xlab="cylinders", ylab="MPG")
# Histograms
hist(mpg)
hist(mpg, col=2)
# Similar to bins in python
hist(mpg, col=2, breaks=15)
pairs(Auto)
pairs(~ mpg + displacement + horsepower + weight + acceleration, Auto)
# Using the interactive identify 
plot(horsepower, mpg)
identify(horsepower, mpg, name)
# Using summary
summary(Auto)

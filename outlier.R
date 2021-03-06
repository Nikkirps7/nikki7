# Outlier Analysis
#outlier not predicted well in by fitted regression model

marks = c(1:80,100, 1000)
marks2 = c(1:80, 100)
marks
par(mfrow=c(1,2))
boxplot(marks2); boxplot(marks)
mean(marks); mean(marks2)
summary(marks)
abline(h=c(1,21.2,41,52.9,61.8,1000))
boxplot(marks)

mean(marks);mean(marks2)







fit2 = lm(weight ~ height + I(height^2), data=women)
par(mfrow=c(2,2)) ;plot(fit2)
par(mfrow=c(1,1)) ; plot(fit2, which=4)
?plot
fit3 = lm(weight ~ height + I(height^2), data=women[-c(13,15),])
fit3
par(mfrow=c(1,1)) ; plot(fit3, which=4)

names(mtcars)
fit = lm(mpg ~ wt + cyl + hp + am + gear, data=mtcars)
boxplot(mtcars)
mtv1 = c('hp', 'disp')
boxplot(mtcars[mtv1])
boxplot(mtcars[-c('hp', 'disp'),])
ix= match(mtv1,names(mtcars))
boxplot(mtcars[,-ix])

library(car)
car::outlier.test(fit)


library(outliers)
set.seed(1234)
x = rnorm(10)
chisq.out.test(x)
chisq.out.test(x,opposite=TRUE)

car::outlier.test(fit, labels=names(rstud))
car::outlier.test(lm(prestige~income+education, data=Duncan))

car::avPlots(fit, ask=F, id.method='identify')
car::influencePlot()

#Identify---
set.seed(482)
y = rnorm(100)
boxplot(y)
identify(rep(1, length(y)), y, labels = seq_along(y))
y[86]
y[57]




#Univariate
url <- "http://rstatistics.net/wp-content/uploads/2015/09/ozone.csv"  
# alternate source:  https://raw.githubusercontent.com/selva86/datasets/master/ozone.csv
inputData <- read.csv(url)  # import data
outlier_values <- boxplot.stats(inputData$pressure_height)$out  
outlier_values
boxplot(inputData$pressure_height, main="Pressure Height", boxwex=0.1)
mtext(paste("Outliers: ", paste(outlier_values, collapse=", ")), cex=0.6)


#Bivariate
url <- "http://rstatistics.net/wp-content/uploads/2015/09/ozone.csv"
ozone <- read.csv(url)
# For categorical variable
boxplot(ozone_reading ~ Month, data=ozone, main="Ozone reading across months")  # clear pattern is noticeable.
boxplot(ozone_reading ~ Day_of_week, data=ozone, main="Ozone reading for days of week")  # this may not be significant, as day of week variable is a subset of the month var.





x <- ozone$pressure_height
qnt <- quantile(x, probs=c(.25, .75), na.rm = T)
caps <- quantile(x, probs=c(.05, .95), na.rm = T)
H <- 1.5 * IQR(x, na.rm = T)
x[x < (qnt[1] - H)] <- caps[1]
x[x > (qnt[2] + H)] <- caps[2]
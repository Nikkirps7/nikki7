#Simple Linear Regression : IIT Gauhati
# Regression : Areas vs Sales

#Method1 : creating data from Vectors
#X -is area sqft Y-sales in 1000s units; Find relationship betn X & Y
X = c(1.7,1.6,2.8,5.6,1.3,2.2, 1.3,1.1,3.2,1.5,5.2,4.6,5.8,3 )
Y = c(3.7,3.9,6.7,9.5,3.4,5.6,3.7,2.7,5.5,2.9,10.7,7.6,11.8,4.1 )

#create a data frame from X & Y
df1 = data.frame(X, Y)
str(df1)
#first few values

#2nd method of importing data
#import from ggsheet  #pickup the correct url
library(gsheet)
url = "https://docs.google.com/spreadsheets/d/1h7HU0X_Q4T5h5D1Q36qoK40Tplz94x_HZYHOJJC_edU/edit#gid=2023826519"


df2 = as.data.frame(gsheet::gsheet2tbl(url))
#first few values

#Third method of importing data from CSV file
df3 = read.csv(file = "I:/projects/nikki7/data/slr1.csv")
str(df3)
#first few values

#Method4 for importing from CSV file with choose
#df4 = read.csv(file.choose())
#first few values

# Use Vector Data or method used to import data
#make one of the DF active
df = df3
str(df)

#Find mean, sum of X & Y, Covariance, Correlation
options(digits = 4)
mean(df$X)
mean(df$Y)
sum(df$X)
sum(df$Y)
sd(df$X) : sd(df$Y)
cor(df$X,df$Y)
cov(df$X,df$Y)
var(df$X)
var(df$Y)

#plot X & Y
plot(df$X,df$Y)
plot(y = df$Y,x = df$X, xlab = "Area in sqft", ylab = "sales amount", type = 'p', col = 'green',pch = 2,xlim = c(0,max(df$X)),ylim=c(0,max(df$Y)))

#draw abline/ prediction line
abline(lm(df$Y ~ df$X), lty=3, lwd=4, col='red')

abline(v=c(3,4,5),h=c(6,7),col=c('yellow','blue','black'))


#Linear Model 
fit= lm(Y~X, data=df)
str(fit)
fit

range(df$X)


#Print the Model, Summary, Coeff, Residuals
summary(fit) # multiple R-square = 0.904 implies 90% variation in Y has been captured by X
             # if p-value is < 0.05 then the Y value can be predicted by a statistical model



#understand the model values - R2, AdjR2, FStats, Residuals, Coeff p values - IMP STEP

#output of variable Names
names(fit)
coefficients(fit) # Y = 0.9645 + 1.6699*X

#Print Slope value
coefficients(fit)[2]

fitted(fit) # fitted predicts the values of Y for all X in the data

#combine the data with Ypredicted, errors
cbind(df, fitted(fit), fitted(fit)-df$Y, residuals(fit)) # residuals gives the difference of expected value and actual value i.e actual - predicted

# Predictions
(Y = 0.9645 + 1.6699 * 4)  # Predict Y for X=4
(Y = coef(fit)[1] + coef(fit)[2] * 4)  # for X=4 using values from output of LM 

fitted(fit)
cbind(df, fitted(fit))  # combine data with predicted values
range(df$X)  #min to max value of X: area

# Create a Data Frame with sample values of X
new1 = data.frame(X=c(1,5,3,2,4.5))
new1

#sample data for X for prediction, should be between the range of X values
#prediction data should be in the form of Data Frame

#Predict

predicty = predict(fit, newdata= new1) # Predict Function for 4 values of X
#fitted(fit1) is equal to predict function using original X values
cbind(new1,predicty)

df$X
predictX = predict(fit, newdata= data.frame(X=df$X))
cbind(df, predictX, fitted(fit))

library(forecast)
accuracy(fit1)


summary(fit1)
summary(fit1)$sigma  #Residual Std Error SD along the LM Line


#Assumption : Graphical Analysis : IMP STEP
plot(df$X, df$Y) # plot of Y & X
plot(x=df$X, y=residuals(fit),type = 'p') # Linearity plot of residuals & X # No pattern for assumption that there is linearity betw X & Y

plot(fit,which = 1)
abline(h=0)
plot(residuals(fit))

#Auto Collinearity : relation between successive values of Y
car::durbinWatsonTest(fit)
#pvalue > 0 : Do not reject Ho that there is no correlation


#Normality of residuals
hist(residuals(fit)) #distribution of Residuals

hist(residuals(fit), freq=F)
lines(density(residuals(fit)))

#histogram values to show how hist rectangle are created
(h=hist(residuals(fit1)))
names(h)
cbind(h$breaks, h$counts)

#Normality Plot to check assumptions of LM
qqnorm(residuals(fit))
qqline(residuals(fit))

#Equal Variance : 4th Assumption : homoscedasticity
plot(y=residuals(fit), x=df$X)
abline(h=0)  #Variance across all x values is almost constant


#Outlier Analysis

boxplot(residuals(fit1), names=c('Residuals'))
identify(rep(1, length(residuals(fit1))), residuals(fit1), labels = seq_along(residuals(fit1)))

car::outlierTest(fit1)

car::outlierTest(lm(Y ~ X, data=df[-c(14,12),]))


omni1 = read.csv(file = "I:/projects/nikki7/data/omni.csv")
str(omni1)



#Make one of data frames active
omni = omni1

?lm  #see help of LM
#Simple Linear Model would look like this
slr1 = lm(sales ~ price, data=omni) # sales depend on price of item
slr2 = lm(formula = sales ~ promotion, data=omni) # sales depend on promotion exp
summary(slr1)
summary(slr2)


#MLR  Create Multiple Linear Regression
# we want to see how Sales Qty depend on Price and Promotion Values
mlr1 = lm(sales ~ price + promotion,omni)
#how to give parameter values in different sequence, use arguments names if in different order
mlr1 = lm( data=omni, formula = sales ~ price + promotion)

# summary statistics of model IMP STEP
summary(mlr1) # adjusted R2 = 0.742 means that 74% of the variance in sales quantity can be explained by price and promotion quantities

#understand values : R2, AdjR2, Fstats pvalue, Coeff, ***, Residuals

#coefficients b1, b2
coef(mlr1)


#Predicted Values----
fitted(mlr1)

names(mlr1)

#create a dataframe of new sample values
(ndata1 = data.frame(price=c(60,70), promotion=c(300,400)))
predict(mlr1,newdata = ndata1)

#cbind the values
cbind(ndata1, Predict = predict(mlr1,newdata = ndata1))





#Plots of the Modle
plot(mlr1,1)  # no pattern, equal variance
plot(mlr1,2)  # Residues are normally distributed
plot(mlr1,3)
plot(mlr1,4)  # tells outliers which affect model



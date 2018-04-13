dataset = read.csv("./data/logr2.csv")
summary(dataset)

#install.packages('caTools')
library(caTools)
set.seed(200)
sample.split(dataset$purchased, SplitRatio = 0.75)
training_set = subset(dataset,split = T)
test_set = subset(dataset,split = F)
nrow(training_set)
dim(test_set)


class(dataset$gender)
names(training_set)
names(dataset)

#fitting logistic regression to the training set
logitmodel = glm(purchased~gender+age+salary,family = binomial,data=training_set)
summary(logitmodel)


#fitting logistic model to the training set - being insignificant is dropped here

logitmodel2 = glm(purchased~age+salary,family = binomial,data = training_set)
summary(logitmodel2)
summary(logitmodel2)$coefficient

test_set2 = data.frame(age=c(40,65),salary=c(40000,50000))
prob_pred2 = predict(logitmodel2,type = 'response',newdata=test_set2)
prob_pred2


cbind(test_set2,prob_pred2)


#predicting the test set results
prob_pred = predict(logitmodel2, type = 'response', newdata = test_set)
df_prob_pred = as.data.frame(prob_pred)
summary(df_prob_pred)
head(df_prob_pred)

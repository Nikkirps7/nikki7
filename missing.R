# missing vales


v1 = c(1,2,NA,NA,5,7,8,10,13,24)
is.na(v1)
mean(v1)
mean(v1,na.rm=T)
v1
sum(v1,na.rm=T)
v1a = na.omit(v1)
sum(v1a)
v1[is.na(v1)] = mean(v1, na.rm=T)
v1


#install.packages('VIM')
library(VIM)
data(sleep, package = 'VIM')
head(sleep)
dim(sleep)
complete.cases(sleep) # all complete rows withot any missing values
sum(complete.cases(sleep))
sum(!complete.cases(sleep))
is.na(sleep$Dream)
sum(is.na(sleep$Dream))
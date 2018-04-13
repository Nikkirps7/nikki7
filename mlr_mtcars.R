#mtcars
mtcars
dim(mtcars)
names(mtcars)
head(mtcars)
?mtcars

mtcarsfit1 = lm(mpg ~ cyl+disp+hp+drat+wt+qsec+vs+am+gear+carb, mtcars)
summary(mtcarsfit1)

install.packages('MASS')
library(MASS)
(model1a = lm(mpg ~ disp + cyl + hp + drat + wt +
                qsec + carb, data=mtcars))
stepboth = stepAIC(model1a,
               direction='both')
stepfwd = stepAIC(model1a, direction = 'forward', scope = list(upper=model1a,lower=model1b))
?stepAIC
names(mtcars)
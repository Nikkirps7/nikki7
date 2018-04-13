# creating data

rollno = c(paste('S',1:30,sep = ''))
rollno

name = c(paste('student',1:30,sep = '','- xyz'))
name

g = c('M','F')
gender = sample(g,30,replace = T)
gender

age = floor(runif(30,20,40))
age

courses = c('BTech','MTech','Phd')
course = sample(courses,30,replace = T,prob = c(0.5,0.3,0.2))
course
?sample

marks = floor(runif(30,0,100))
marks

isornot = c('TRUE','FALSE')
married = sample(isornot,30,replace = T,prob = c(0.2,0.8))
married

# data frame of above columns
df = data.frame(rollno,name,gender,age,course,marks,married)
df

# splitting the data
sample(nrow(df),3)
df1 = df[sample(nrow(df),3),]
df1

df2 = subset(df,age>=20 & age<30, select=c(rollno,name,age))
df2

library(dplyr)
df2a = subset(df, marks>35,select=c(rollno,name,age,marks)) %>% arrange(desc(marks))
df2a

df3 = sample_n(df,10)
df3
df4 = sample_frac(df,0.7)
df4

df5 = df[which(gender=='F'|age>25),]
df5

write.csv(df, './data/students.csv',row.names = F)
#install.packages('rJava')
#install.packages('xlsx')
#Sys.setenv(JAVA_HOME="C:\\Users\\Nikhil\\AppData\\Local\\Temp\\RtmpOOBROg\\downloaded_packages\\Java\\jre1.8.0_144")
#library(xlsx)
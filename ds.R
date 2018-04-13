#data structures in R

#Vectors----
v1 = c('A','B')
dim(v1)
v1
v2 = c(1,2,3)
v2
class(v2)
v3 = 1:10

v3[v3 %in% v2]


#Matrix----
m1 = matrix(2,nrow=2,ncol=2)
dim(m1)
m1
m2 = matrix(2:5,nrow=2,ncol=2)
m2
m3 = matrix(1:24,ncol=6,byrow=T)
m3
m4 = matrix(11:25,nrow=5,byrow=F)
m4[1, ]
m4[2, ]
m4[ ,3]

dimnames(m4) = list(c(paste('R',1:5,sep='_')),c(paste('C',1:3,sep='_')))
m4
?paste
?dimnames

dimnames(m3) = list(c(paste('R',1:4,sep='')),c(paste('C',1:6,sep='')))
m3
rowSums(m3)
colSums(m3)
rowMeans(m3)
colMeans(m3)




#Arrays----

a1 = array(101:124,dim=c(4,3,2))
a1

r1=c(paste('S',1:4,sep=''))
c1=c(paste('sub',1:3,sep=''))
s1=c(paste('dept',1:2,sep=''))

a2 = array(1:24,dim=c(4,3,2),dimnames = list(r1,c1,s1))
a2

apply(a1,1,sum)
apply(a2,c(2,3),mean)
apply(a2,c(1,2),max)

#List----

#Factors----
name = c('s1','s2','s3','s4','s5')
course = c('Phd','MTech','BTech','BTech','Phd')
gender = c('M','F','M','M','F')
grades =c('A','C','B','A','D')
marks = c(runif(5,50,100))
students = data.frame(name,gender,course,grades,marks)
students
str(students)
students[1:3,]
students[,1:4]
students$name = as.character(students$name)
str(students)
students$grades = factor(students$grades, ordered=F, levels = c('A','B','C','D','E','F'))
str(students)
students$grades

#DataFrame----
rollno = c(1,2,3)
name = c('Nikhil','Arcot','Venkatesh')
course = c('BTech','Mtech','Phd')
dept = c('Mathematics','Chemistry','Physics')
marks = floor(runif(3,50,100))




df = data.frame(name = c('Nikhil','Arcot','Venkatesh'),
                course = c('BTech','Mtech','Phd'),
                dept = c('Mathematics','Chemistry','Physics'),
                marks = floor(runif(3,50,100)))

class(df)
df

str(df)
summary(df)


df = read.csv(file = "C:/Users/Nikhil/Desktop/ipl.csv")
head(df)

bd = df
class(bd)
summary(bd)
dim(bd)
batsmen = unique(bd$Batsman)
bd = bd[order(bd$runs_scored,decreasing = T),]
head(bd,10)

library(dplyr)
bd1 = arrange(bd%>%filter(won == 0),desc(runs_scored)) %>% select(Batsman,runs_scored,Team,opponent)
bd1
write.csv(bd1[1:10,],file = "losing.csv")
losing = bd1[1:10,]
losing
str(losing)

plot(x6,x7)
title(main = "Top batting performances that ended in losing cause")

x6 = bd1$Batsman[1:10]
x6
x7 = bd1$runs_scored[1:10]
x7
barplot(x7,horiz = F,ylim = c(0,140),names.arg = x7)

library(gridExtra)
pdf("losing.pdf", height=11, width=11)
plot(NA,xlim = c(0,20),ylim = c(0,20),xlab = '',ylab = '',bty='n',xaxt='n',yaxt='n')
grid.table(losing)
text(10,15,"Top batting performances that ended in losing cause",pos = 3,cex = 1.5,col = 'red')
dev.off()
?pdf.options
?text
?plot


bd2 = arrange(bd%>%filter(Batsman == 'Ambati Rayudu' & Batting_Position<=2)) %>% select(runs_scored,balls_faced,opponent)
bd2


bd3 = arrange(bd%>%filter(Batsman == 'Ambati Rayudu' & Batting_Position>2)) %>% select(runs_scored,balls_faced,opponent)
bd3

x = c(sum(bd2$runs_scored),sum(bd3$runs_scored))
x
x0 = c((sum(bd2$runs_scored)/sum(bd2$balls_faced))*100,(sum(bd3$runs_scored)/sum(bd3$balls_faced))*100)
name = x
name
name0 = x0
lab = c("opener","middle-order")
colours = c("orange","brown")
png(filename = "rayudu_runs.png")
barplot(x,col = colours,names.arg = name,main = "Rayudu runs as opener and down the order")
legend("topright",lab,fill=unique(colours))

dev.off()

png(filename = "rayudu_sr.png")
barplot(x0,col = colours,names.arg = name0,main = "Rayudu strike rate as opener and down the order")
legend("topright",lab,fill=unique(colours))

dev.off()


bd4 = arrange(bd%>%filter(Batsman == 'Jos Butler' & Batting_Position<=2)) %>% select(runs_scored,balls_faced,opponent)
bd4


bd5 = arrange(bd%>%filter(Batsman == 'Jos Butler' & Batting_Position>2)) %>% select(runs_scored,balls_faced,opponent)
bd5

x1 = c(sum(bd4$runs_scored),sum(bd5$runs_scored))
x1
x2 = c((sum(bd4$runs_scored)/sum(bd4$balls_faced))*100,(sum(bd5$runs_scored)/sum(bd5$balls_faced))*100)
name1 = x1
name1
name2 = x2
lab1 = c("opener","middle-order")
colours1 = c("purple","yellow")
png(filename = "butler_runs.png")
barplot(x1,col = colours1,names.arg = name1,main = "Butler runs as opener and down the order")
legend("topright",lab1,fill=colours1)

dev.off()

png(filename = "butler_sr.png")
barplot(x2,col = colours1,names.arg = name2,main = "Butler strike rate as opener and down the order")
legend("topright",lab1,fill=colours1)

dev.off()

captains = c('Virat Kohli','MS Dhoni','Dinesh Karthik','Kane Williamson','Rohit Sharma','Ajinkya Rahane')
bd6 = arrange(bd%>%filter(Batsman %in% captains),desc(Batsman)) %>% select(Batsman,runs_scored,balls_faced)
bd6

df2 = bd6 %>% group_by(Batsman) %>% summarise(Runs = sum(runs_scored)) %>% arrange(desc(Runs))
x5 = df2$Runs
name3 = c("Williamson","Kohli","DK","MSD","Rahane","Rohit")
png(filename = "cap.png")
barplot(x5,col = c(3,4,5,6,7,8),names.arg = name3,main = "Runs by captains in IPL 2018",ylim = c(0,800))
text(c(1,2,3.3,4.5,5.5,6.7),x5,labels = x5,pos = 3,col = 1)
dev.off()
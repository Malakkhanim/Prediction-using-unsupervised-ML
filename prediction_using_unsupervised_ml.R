#Data Science and Business Analytics, September 2021
#Task-2 Prediction using unsupervised ML


#import dataset



library(readxl)
Iris <- read_excel("C:/Users/user/Downloads/Iris.xlsx")
data=as.data.frame(Iris)
summary(data)


#plotting data
x=data$SepalLengthCm
y=data$SepalWidthCm
library(ggplot2)
ggplot(data,aes(x=SepalLengthCm, y=SepalWidthCm, col=Species)) + geom_point()
ggplot(data,aes(x=PetalLengthCm, y=PetalWidthCm, col=Species)) + geom_point()


#number of clusters
data_new=data[,2:5]
tot_wss=c()
for(i in 1:15)
{
  p=kmeans(data_new, centers=i)
  tot_wss[i]=p$tot.withinss
}

tot_wss
plot(x=1:15, y=tot_wss, type="b", xlab="Number of Clusters", ylab="within groups")

#Apply
data2=data.frame(x, y)
data2
p=kmeans(data2, centers=3 )
plot(x,y,col=p$cluster, pch=19 )
points(p$centers, col= 1:3, pch=4, cex=3, lwd=4 )


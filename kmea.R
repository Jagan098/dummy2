mydata<-read.csv("C:/Users/jagan/Downloads/USArrests.csv")
head(mydata) 
tail(mydata) 
mydata$rownames 
install.packages("factoextra") 
library(factoextra) 
USdata <- scale(mydata[,-1]) 
head(USdata) 
kmeans.cluster_2 <- kmeans(USdata, centers = 2, nstart = 20) 
kmeans.cluster_2 
kmeans.cluster_3 <- kmeans(USdata, centers = 3, nstart = 20) 
kmeans.cluster_3 
kmeans.cluster_4 <- kmeans(USdata, centers = 4, nstart = 20) 
kmeans.cluster_4 
kmeans.cluster_5 <- kmeans(USdata, centers = 5, nstart = 20) 
kmeans.cluster_5
kmeans.cluster_2$cluster 
kmeans.cluster_3$cluster 
kmeans.cluster_4$cluster 
kmeans.cluster_5$cluster 
fviz_cluster(kmeans.cluster_2, data = USdata) 
fviz_cluster(kmeans.cluster_3, data = USdata) 
fviz_cluster(kmeans.cluster_4, data = USdata) 
fviz_cluster(kmeans.cluster_5, data = USdata) 
fviz_nbclust(USdata, FUN = kmeans, method = "silhouette")


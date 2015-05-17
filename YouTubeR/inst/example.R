library(YouTubeR)
library(dplyr)
library(tidyr)
library(googleVis)
library(ggplot2)
library(reshape2)

name<-"allindiabakchod"

id<-"QSK_DbnLrlI"

key<-"AIzaSyDUb-uRZIeGtmVoEDeRyEeuwjQ0jjTMX8c"

ARPAN01234<-getvideoIdlist(name,key)

VideoData<-getvideodata(id,key)

videoviz(VideoData)

VideoData[4]

VideoData00<-data.frame(VideoData[9:17])

VideoData00<-cbind.data.frame(c("viewCount","likeCount","dislikeCount","favoriteCount","commentCount","fbShareCount","fbLikeCount","fbCommentCount","twitterShareCount"),VideoData00)
names(VideoData00)<-c("name","value")
ggplot(data=VideoData00, aes(x=name, y=value)) +
  geom_bar(aes(fill = name),stat="identity")

names(VideoData0)<-c("id","publishedAt","channelId","title","description","duration","channelTitle","categoryId","viewCount","likeCount","dislikeCount","favoriteCount","commentCount","fbShareCount","fbLikeCount","fbCommentCount","twitterShareCount")

ggplot(data=VideoData0, aes(x=time, y=total_bill)) +
  geom_bar(stat="identity")

AllVideoData<-getallvideodata(ARPAN01234,key)
###################################################

df<-AllVideoData[,9:17]

df$id<-AllVideoData$title

df.t<-df[1:5,2:10]%>%
  gather(id)
  
names(df.t)<-c("id","variable","value")

ggplot(df.t, aes(id, value)) +   
  geom_bar(aes(fill = variable), position = "dodge", stat="identity")+coord_flip()+
  facet_grid(. ~ id)

#########################################

dummyfunct<-function(){
  df <- data.frame(time = factor(c("Lunch","Dinner"), levels=c("Lunch","Dinner")),
                   total_bill = c(14.89, 17.23))
  x <- ggplot(data=df, aes(x=time, y=total_bill)) + geom_bar(aes(fill=time))
  print(x)
  return(df)
} 

dummyfunct()

########################################





VideoFBShare<-getfbshare(id)

VideoTwitterShare<-gettwittershare(id)

save.image()






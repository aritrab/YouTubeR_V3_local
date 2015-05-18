library(YouTubeR)
library(dplyr)
library(tidyr)
library(googleVis)
library(ggplot2)
library(reshape2)

name<-"allindiabakchod"

id<-"KtPv7IEhWRA"

key<-"AIzaSyDUb-uRZIeGtmVoEDeRyEeuwjQ0jjTMX8c"

ARPAN01234<-getvideoIdlist(name,key)

VideoData<-getvideodata(id,key)

videoviz(VideoData)

VideoFBShare<-getfbshare(id)

VideoTwitterShare<-gettwittershare(id)

save.image()


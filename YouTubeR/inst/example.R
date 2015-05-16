library(YouTubeR)

name<-"ARPAN01234"

id<-"QSK_DbnLrlI"

key<-"AIzaSyDUb-uRZIeGtmVoEDeRyEeuwjQ0jjTMX8c"

ARPAN01234<-getvideoIdlist(name,key)

VideoData<-getvideodata(id,key)

AllVideoData<-getallvideodata(ARPAN01234,key)

VideoFBShare<-getfbshare(id)

VideoTwitterShare<-gettwittershare(id)




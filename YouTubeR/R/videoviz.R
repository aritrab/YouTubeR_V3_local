videoviz<-function(videodata){
  
  
  df<-data.frame(as.numeric(videodata[9:17]))
  
  df<-cbind.data.frame(c("viewCount","likeCount","dislikeCount","favoriteCount","commentCount","fbShareCount","fbLikeCount","fbCommentCount","twitterShareCount"),df)
  
  names(df)<-c("variable","count")
  
  df$count<-as.numeric(df$count)
  
  cbbPalette <- c("#DD8888", "#E69F00","#999999", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
  
  videoviz<-ggplot(data=df, aes(x=variable, y=count)) +
  geom_bar(aes(fill = variable),stat="identity")+
  xlab("Name of the variable ") + ylab(paste0("Hit count in various social network websites at ",sprintf("%s",Sys.time()))) +
  ggtitle(paste0("YouTube video title: ",sprintf("%s", videodata[4])))+
  scale_fill_manual(values=cbbPalette)+theme_grey()
  
  print(videoviz)
  
  return(videoviz)
    
}





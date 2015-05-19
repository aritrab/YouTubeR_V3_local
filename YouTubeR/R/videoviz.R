videoviz<-function(videodata){
  
  library(RColorBrewer)
  
  df<-data.frame(as.numeric(videodata[9:17]))
  
  df<-cbind.data.frame(c("viewCount","likeCount","dislikeCount","favoriteCount","commentCount","fbShareCount","fbLikeCount","fbCommentCount","twitterShareCount"),df)
  
  names(df)<-c("variable","count")
  
  df$count<-as.numeric(df$count)
  
  cbbPalette <- c("#FBB4AE" ,"#B3CDE3", "#CCEBC5", "#DECBE4", "#FED9A6", "#FFFFCC", "#E5D8BD", "#FDDAEC","#F2F2F2")
  
  ggplot2::theme_set(theme_light())
  videoviz<-ggplot(data=df, aes(x=variable, y=count)) +
  geom_bar(aes(fill = variable),stat="identity")+
  xlab("Name of the variable ") + ylab(paste0("Hit count in various social network websites at ",sprintf("%s",Sys.time()))) +
  ggtitle(paste0("YouTube video title: ",sprintf("%s", videodata[4])))+
  scale_colour_brewer(palette="Dark2")
  
  print(videoviz)
  
  return(videoviz)
    
}





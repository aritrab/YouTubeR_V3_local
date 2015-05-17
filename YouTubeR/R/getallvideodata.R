getallvideodata<-function(videoIdlist,key){
  
  df_df0<-sapply(videoIdlist,getvideodata,key=key)
  df_df0<-data.frame(t(df_df0))
  
  names(df_df0)<-c("id","publishedAt","channelId","title","description","duration","channelTitle","categoryId","viewCount","likeCount","dislikeCount","favoriteCount","commentCount","fbShareCount","fbLikeCount","fbCommentCount","twitterShareCount")
  
  df_df0<-dplyr::tbl_df(df_df0)
  

  
  df_df0$viewCount<-as.numeric(as.character(df_df0$viewCount)); 
  df_df0$likeCount<-as.numeric(as.character(df_df0$likeCount)); 
  df_df0$dislikeCount<-as.numeric(as.character(df_df0$dislikeCount)); 
  df_df0$favoriteCount<-as.numeric(as.character(df_df0$favoriteCount)); 
  df_df0$commentCount<-as.numeric(as.character(df_df0$commentCount));
  df_df0$fbShareCount<-as.numeric(as.character(df_df0$fbShareCount));
  df_df0$fbLikeCount<-as.numeric(as.character(df_df0$fbLikeCount));
  df_df0$fbCommentCount<-as.numeric(as.character(df_df0$fbCommentCount));
  df_df0$twitterShareCount<-as.numeric(as.character(df_df0$twitterShareCount));
  df_df0$categoryId<-as.numeric(as.character(df_df0$categoryId))

  return(df_df0)}
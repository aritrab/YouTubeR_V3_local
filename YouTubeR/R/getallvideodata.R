getallvideodata<-function(videoIdlist,key){
  
  df<-sapply(allindiabakchod,getvideodata,key=key)
  
  df_df<-dplyr::tbl_df(as.data.frame(df))
  
  df_df0<-dplyr::tbl_df(as.data.frame(t(df_df)))
  
  names(df_df0)<-c("videoId","publishedAt","channelId","title","description","duration","channelTitle","categoryId","viewCount","likeCount","dislikeCount","favoriteCount","commentCount","fbShareCount", "fbLikeCount", "fbCommentCount","twitterShareCount")
    
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
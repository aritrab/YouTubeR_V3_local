getvideodata <- function(id, key) {
  
  url = paste0("https://www.googleapis.com/youtube/v3/videos?part=snippet%2Cstatistics%2CcontentDetails&id=", sprintf("%s", id), "&maxResults=50&key=", sprintf("%s", key))
  
  raw.data <- retry(httr::GET(paste0(url)), url)
  
  raw.data <- retry_raw_data(httr::content(raw.data, "text"), raw.data)
  
  data <- retryfromJSON(rjson::fromJSON(raw.data), raw.data, httr::content(raw.data, "text"), url, httr::GET(paste0(url)))
  
  dataset.df<-fbshare(id)
  
  twittershare<-twittershare(id)
  
  fbshareCount<-dataset.df[[1]][[1]][1]
  
  fblikeCount<-dataset.df[[1]][[1]][2]
  
  fbcommentCount<-dataset.df[[1]][[1]][3]
  
  df <- c(id, data$items[[1]]$snippet$publishedAt, data$items[[1]]$snippet$channelId, data$items[[1]]$snippet$title, data$items[[1]]$snippet$description, data$items[[1]]$contentDetails$duration, data$items[[1]]$snippet$channelTitle, data$items[[1]]$snippet$categoryId, data$items[[1]]$statistics$viewCount, 
          data$items[[1]]$statistics$likeCount, data$items[[1]]$statistics$dislikeCount, data$items[[1]]$statistics$favoriteCount, data$items[[1]]$statistics$commentCount,fbshareCount,fblikeCount,fbcommentCount,twittershare)
  
  names(df)<-NULL
  
  return(df)
  
} 
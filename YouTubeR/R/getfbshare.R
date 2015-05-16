getfbshare <- function(videoId) {
  
  fqlQuery = "select share_count,like_count,comment_count from link_stat where url=\""
  
  url = "https://www.youtube.com/watch?v="
  
  url = paste(url, videoId, sep = "")
  
  queryUrl = paste0("http://graph.facebook.com/fql?q=", fqlQuery, url, "\"")
  
  lookUp <- URLencode(queryUrl)
  
  rd <- readLines(lookUp, warn = "F")
  
  data <- rjson::fromJSON(rd)
  
  data <- as.data.frame(data)
  
  names(data) <- c("ShareCount", "LikeCount", "CommentCount")
  
  data$ShareCount<-as.numeric(as.character(data$ShareCount))
  
  data$LikeCount<-as.numeric(as.character(data$LikeCount))
  
  data$CommentCount<-as.numeric(as.character(data$CommentCount))
  
  
  return(data)
} 
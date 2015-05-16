gettwittershare<-function(videoId){
  
  url="https://www.youtube.com/watch?v="
  
  url=paste(url,videoId,sep = "")
  
  target=paste0("http://urls.api.twitter.com/1/urls/count.json?url=",url)
  
  rd <- readLines(target, warn="F") 
  
  dat <- rjson::fromJSON(rd)
  
  twittershare<-as.numeric(as.character(dat$count))
  
  return(twittershare)
}
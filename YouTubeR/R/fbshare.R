fbshare <- function(vidID) {
  
  fqlQuery = "select share_count,like_count,comment_count from link_stat where url=\""
  
  url = "https://www.youtube.com/watch?v="
  
  url = paste(url, vidID, sep = "")
  
  queryUrl = paste0("http://graph.facebook.com/fql?q=", fqlQuery, url, "\"")
  
  lookUp <- URLencode(queryUrl)
  
  rd <- readLines(lookUp, warn = "F")
  
  data <- rjson::fromJSON(rd)
  
  return(data)
}
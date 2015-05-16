getvideoIdlist <- function(name, key) {
  
  print("Channel Name :")
  print(name)
  
  url = paste0("https://www.googleapis.com/youtube/v3/search?part=snippet&q=", sprintf("%s", name), "&type=channel&key=", sprintf("%s", key))
  
  raw.data <- retry(httr::GET(paste0(url)), url)
  
  raw.data <- retry_raw_data(httr::content(raw.data, "text"), raw.data)
  
  data <- retryfromJSON(rjson::fromJSON(raw.data), raw.data, httr::content(raw.data, "text"), url, httr::GET(paste0(url)))
  
  channelId <- data$items[[1]]$id$channelId
  
  print("Channel Id :")
  print(channelId)
  
  url = paste0("https://www.googleapis.com/youtube/v3/channels?part=contentDetails&id=", sprintf("%s", channelId), "&key=", sprintf("%s", key))
  
  raw.data <- retry(httr::GET(paste0(url)), url)
  
  raw.data <- retry_raw_data(httr::content(raw.data, "text"), raw.data)
  
  data <- retryfromJSON(rjson::fromJSON(raw.data), raw.data, httr::content(raw.data, "text"), url, httr::GET(paste0(url)))
  
  uploads <- data$items[[1]]$contentDetails$relatedPlaylists$uploads
  
  url = paste0("https://www.googleapis.com/youtube/v3/playlistItems?part=contentDetails&maxResults=50&playlistId=", sprintf("%s", uploads), "&key=", sprintf("%s", key))
  
  raw.data <- retry(httr::GET(paste0(url)), url)
  
  raw.data <- retry_raw_data(httr::content(raw.data, "text"), raw.data)
  
  data <- retryfromJSON(rjson::fromJSON(raw.data), raw.data, httr::content(raw.data, "text"), url, httr::GET(paste0(url)))
  
  totalResults <- data$pageInfo$totalResults
  
  print("Total videos in the channel :")
  print(totalResults)
  
  nextPageToken <- data$nextPageToken
  
  if (totalResults < 51) {
    
    x = data$items
    
    vidID <- sapply(x, function(x) x$contentDetails$videoId)
    
    videoIdlist<-vidID
    
    return(videoIdlist)
  }
  
  else{
  
  i <- 1
  count <- 1
  
  while (i < (totalResults + 1)) {
    
    if (i == 1) {
      
      url = paste0("https://www.googleapis.com/youtube/v3/playlistItems?part=contentDetails&maxResults=50&playlistId=", sprintf("%s", uploads), "&key=", sprintf("%s", key))
      
      raw.data <- retry(httr::GET(paste0(url)), url)
      
      raw.data <- retry_raw_data(httr::content(raw.data, "text"), raw.data)
      
      data <- retryfromJSON(rjson::fromJSON(raw.data), raw.data, httr::content(raw.data, "text"), url, httr::GET(paste0(url)))
      
      nextPageToken <- data$nextPageToken
      
      x = data$items
      
      vidID <- sapply(x, function(x) x$contentDetails$videoId)
      
      
      if (i + 50 >= totalResults) {
        i = (i + 1)
        count=count+totalResults%%50
        
      } else {
        i = i + 50
        count=count+50
      }
      
    }
    
    
    if (i > 1) {
      
      url = paste0("https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=50&pageToken=", sprintf("%s", nextPageToken), "&playlistId=", sprintf("%s", uploads), "&key=", sprintf("%s", key))
      
      raw.data <- retry(httr::GET(paste0(url)), url)
      
      raw.data <- retry_raw_data(httr::content(raw.data, "text"), raw.data)
      
      data <- retryfromJSON(rjson::fromJSON(raw.data), raw.data, httr::content(raw.data, "text"), url, httr::GET(paste0(url)))
      
      nextPageToken <- data$nextPageToken
      
      x = data$items
      
      vidID1 <- sapply(x, function(x) x$snippet$resourceId$videoId)
      
      if (count == totalResults) 
        
        break
      
      if (i + 50 >= totalResults) {
        i = (i + 1)
        count = count + totalResults%%50
      } else {
        i = i + 50
        count = count + 50
      }

    }
    
    vidID <- c(vidID, vidID1)
    
    rm(vidID1)
    
  }
  }
  
  videoIdlist<-unique(vidID)
  
  return(videoIdlist)
  
}
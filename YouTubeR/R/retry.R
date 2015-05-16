#' retry 
#' This is a general error handeling function. base function used in this function
#' is try() and trycatch()
#' In package this function will mainly handel erros of the following functions 
#' httr::GET, base::readLines or rjson::fromJSON 
#' 
#' @param .FUN is a string variable. It is the string form of supplied function which is going to be 
#' evaluated and the function retry will deal with the errors commited in this process. 
#' @param url is a string variable. This is going to be used as a input parameter in the .FUN function
#' supplied by the user. 
#' 
#' @return x is a string variable. Mainly x will contain data obtained from api either in XML ,JSON or 
#' simply in text fromat. 
#' @export 

retry <- function(.FUN, url, max.attempts = 5, sleep.seconds = 30) {
  
  x <- NULL
  
  url <- url
  
  for (i in 1:max.attempts) 
  {
    
    f <- substitute(.FUN)
    
    x <- try({
      eval(f)
    })
    
    if (class(x) == "try-error") {
      
      x <- try({
        eval(f)
      })
    } else {
      
      return(x)
      
    }
    
  }
  
  x
}
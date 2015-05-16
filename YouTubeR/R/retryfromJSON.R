retryfromJSON <- function(.FUN0, raw.data, .FUN1, url, .FUN2, max.attempts = 5, sleep.seconds = 30) {
  x0 <- NULL
  x1 <- NULL
  raw.data <- raw.data
  url <- url
  for (i in 1:max.attempts) {
    f0 <- substitute(.FUN0)
    f1 <- substitute(.FUN1)
    f2 <- substitute(.FUN2)
    x0 <- try({
      eval(f0)
    })
    if (class(x0) == "try-error") {
      x0 <- try({
        raw.data <- eval(f2)
        raw.data <- eval(f1)
        eval(f0)
      })
    } else {
      return(x0)
    }
  }
  x0
} 
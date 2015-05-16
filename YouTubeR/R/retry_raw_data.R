retry_raw_data <- function(.FUN, raw.data, max.attempts = 5, sleep.seconds = 30) {
  x <- NULL
  raw.data <- raw.data
  for (i in 1:max.attempts) {
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
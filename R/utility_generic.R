# Generic utiliy functions of the package

# In case of a missing argument, stops execution and prints error message
misssing_msg <- function(string)
  stop(paste0('There is a missing argument: \'', string, '\''), call.=FALSE)

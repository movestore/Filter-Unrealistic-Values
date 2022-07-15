library('move')

rFunction <- function(data,variab,rel,valu,time=FALSE,delete=FALSE)
{
  Sys.setenv(tz="UTC")

  if (is.null(variab) | is.null(rel) | is.null(valu)) logger.info("One of your parameters has not been set. This will lead to an error.")
  
  if (variab %in% names(data))
  {

    if (rel=="%in%") #works for numeric or character values
    {
      valus <- strsplit(as.character(valu),",")[[1]]
      fullrel <- data@data[[variab]] %in% valus
    } else
    {
      if (time==TRUE) fullrel <- eval(parse(text=paste0("as.POSIXct(data@data$",variab,") ",rel," as.POSIXct('",valu,"')"))) else fullrel <- eval(parse(text=paste0("data@data$",variab," ",rel," '",valu,"'")))
    }
      
    if (any(fullrel))
    {
      if (delete == TRUE) data <- data[-which(fullrel)] else data@data[which(fullrel),variab] <- NA

    } else logger.info("None of your data fulfill the required property. No unrealistic cases.")
      
  } else logger.info("You selected variable is not available in the data set. Go back and reconfigure the App.")
  
  result <- data #return (possibly adapted) input data set
  return(result)
}

  
  
  
  
  
  
  
  
  
  

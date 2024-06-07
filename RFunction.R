library('move2')
library('units')

rFunction = function(data, variab,rel,valu,time=FALSE,delete=FALSE,setto=NULL, ...) {
 
  Sys.setenv(tz="UTC")
  
  if (is.null(variab) | is.null(rel) | is.null(valu)) logger.info("One of your parameters has not been set. This will lead to an error.")
  
  if (variab %in% names(data))
  {
    
    if (rel=="%in%") #works for numeric or character values
    {
      valus <- strsplit(as.character(valu),",")[[1]]
      fullrel <- data[[variab]] %in% valus
    } else
    {
      if (time==TRUE) fullrel <- eval(parse(text=paste0("as.POSIXct(data$",variab,") ",rel," as.POSIXct('",valu,"')"))) else fullrel <- eval(parse(text=paste0("as.numeric(data$",variab,") ",rel,valu))) 
    }

    if (any(fullrel))
    {
      if (delete == TRUE) data <- data[-which(fullrel),] else 
      {
        if (is.null(setto)) 
        {
          data[which(fullrel),variab] <- NA 
          logger.info(paste(length(which(fullrel)),"values fulfill your relation and will be set to NA"))
        } else if (setto=="mean")
        {
          mea <- mean(as.data.frame(data)[which(!fullrel),variab],na.rm=TRUE)
          data[which(fullrel),variab] <- mea 
          logger.info(paste(length(which(fullrel)),"values fulfill your relation and will be set to the mean of all other values:",mea))
        } else if (setto=="median")
        {
          med <- median(as.data.frame(data)[which(!fullrel),variab],na.rm=TRUE)
          data[which(fullrel),variab] <- med
          logger.info(paste(length(which(fullrel)),"values fulfill your relation and will be set to the median of all other values:",med))
        } else if (rel == "%in%" | time==TRUE)
        {
          data[which(fullrel),variab] <- setto
          logger.info(paste0(length(which(fullrel))," values fulfill your relation and will be set to `",setto,"`"))
        } else if (!is.na(as.numeric(setto))) #if it is a number
        {
          if (is.numeric(data[,variab])) data[which(fullrel),variab] <- as.numeric(setto) else #if it is has a unit
          {
            eval(parse(text=paste0("unts <- units(data$",variab,")")))
            units(setto) <- unts
            data[which(fullrel),variab] <- setto
          }
          logger.info(paste(length(which(fullrel)),"values fulfill your relation and will be set to",setto))
        } else
        {
          logger.info("Your set value does not fit with the data type of the variable. Please adapt your Settings. Your seleted variable will not be adapted.")
        }
      }
      
    } else logger.info("None of your data fulfill the required property. No unrealistic cases.")
    
  } else logger.info("You selected variable is not available in the data set. Go back and reconfigure the App.")
  
  result <- data #return (possibly adapted) input data set
  return(result)
}

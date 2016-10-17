library(plyr)
#
# Programming Problem 1
#
pollutantmean <- function(directory, pollutant,  id = 1:332) {
    # Load all file names into 
    files <- list.files(path=directory, pattern = "*.(csv|CSV)") 
    
    setwd(directory)
    # print(getwd())
    
    existingDF <- data.frame(Date=as.Date(character()),
                             sulfate=double(),
                             nitrate=double(),
                             ID=integer())    
    
    for (i in 1:length(files)) { 
        temp <- read.csv(files[i], header = TRUE)
        existingDF <- rbind(existingDF, temp)
        #  print(files[i])
    } 
    df <- subset(existingDF, ID %in% id)
    mean(df[[pollutant]],na.rm=TRUE)
} 

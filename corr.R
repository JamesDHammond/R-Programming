#
# Programming Problem 3
#
corr <- function(directory, lobs, threshold=0) {
    # lobs vector comes from the complete function across all files in specdata
    # Use that to subset the files to look at for corr
    thresholdVector <- subset(lobs, nobs >= threshold)
    idList <- thresholdVector$id
    # print(thresholdVector)
    # No error checking, so make sure this is the right directory
    setwd(directory)
    #Set variable to indicate this is the first run through the loop or not
    firstTime <- TRUE
    #Now get the list of files and process them    
    for ( i in idList ){
        num <- sprintf("%03d", i)
        fileName <- paste(num, ".csv", sep="")
        rawdata <- read.csv(fileName, header = TRUE)
        # remove everything but complete cases
        finalData <- rawdata[complete.cases(rawdata),]
        correlation <- cor(finalData$sulfate,finalData$nitrate)
        print ("start this loop")
        print (fileName)
        print(correlation)
        if ( !firstTime ){
            allCorrelations <- rbind(allCorrelations, correlation)
        }
        else {
            firstTime <- FALSE
            allCorrelations <- correlation
        }
        print (allCorrelations)
        print ("Done this loop")
    }
    # no records found
    if ( firstTime ) {
        allCorrelations <- 0
    }
    allCorrelations
}
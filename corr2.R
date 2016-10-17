#
# Programming Problem 3
#
corr <- function(directory, threshold=0) {
    files <- list.files(path=directory, pattern = "*.(csv|CSV)") 
    # Change to the working directory
    setwd(directory)
    # Set a Boolean to indicate whether this is the first run or not
    firstTime <- TRUE
    # print(getwd())
    # Create an empty structure for the end result
    solution <- data.frame(id=integer(),
                           nobs=integer())
    #Now get the list of files and process them    
    for ( i in 1:332 ){
        num <- sprintf("%03d", i)
        fileName <- paste(num, ".csv", sep="")
        rawdata <- read.csv(fileName, header = TRUE)
        #print (fileName)
        numRows <- nrow(rawdata)
        numNARows <- sum(is.na(rawdata$sulfate) | is.na(rawdata$nitrate))
        remRows <- numRows - numNARows
        if (remRows > threshold){
            finalData <- rawdata[complete.cases(rawdata),]
            correlation <- cor(finalData$sulfate,finalData$nitrate)
            if ( !firstTime ){
                allCorrelations <- c(allCorrelations, correlation)
            }
            else {
                firstTime <- FALSE
                allCorrelations <- correlation
            }
        }
        else {
            next
        }
    }  
    # no records found
    if ( firstTime ) {
        allCorrelations <- 0
    }
    allCorrelations
}
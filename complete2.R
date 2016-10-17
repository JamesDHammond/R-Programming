#
# Programming Problem 2
#
complete <- function(directory, id=1:332){
    files <- list.files(path=directory, pattern = "*.(csv|CSV)") 
    
    setwd(directory)
    # print(getwd())
    # Create an empty structure for the end result
    solution <- data.frame(id=integer(),
                           nobs=integer())
    #Now get the list of files and process them    
    for ( i in id ){
        num <- sprintf("%03d", i)
        fileName <- paste(num, ".csv", sep="")
        rawdata <- read.csv(fileName, header = TRUE)
        #print (fileName)
        numRows <- nrow(rawdata)
        numNARows <- sum(is.na(rawdata$sulfate) | is.na(rawdata$nitrate))
        remRows <- numRows - numNARows
        solution <- rbind(solution, data.frame(id = i, nops = remRows))
        #print (numRows)
        #print (numNARows)
        #print (remRows)
        #print (solution)
    }  
#    colnames(solution) <- c("id","nobs")
    solution
}

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
        print (fileName)
        numRows <- nrow(rawdata)
        numNARows <- nrow(is.na(rawdata$sulfate) | is.na(rawdata$nitrate))
        finalData <- rawdata[complete.cases(rawdata),]
        if (nrow(finalData) == 0) {
            # Add a row that indicates there are no complete cases for this ID
            emptyRow <- matrix(c(id,0),nrow=1,ncol=2)
            colnames(emptyRow) <- c("id","nobs")
            print ("Got here")
            print (emptyRow)
            print ("After empty row")
            if (nrow(solution) == 0) {
                print ("got to enter")
                solution <- emptyRow
            }
            else {
                rbind(solution,emptyRow)
            }

        }
        else {
            solution <- rbind(solution,ddply(finalData,"ID",nrow))
        }
        colnames(solution) <- c("id","nobs")
        solution
    }  
    colnames(solution) <- c("id","nobs")
    solution
}

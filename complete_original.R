#
# Programming Problem 2
#
complete <- function(directory, id=1:332){
    files <- list.files(path=directory, pattern = "*.(csv|CSV)") 
    
    setwd(directory)
    # print(getwd())
    existingDF <- data.frame(Date=as.Date(character()),
                             sulfate=double(),
                             nitrate=double(),
                             ID=integer())
    
    for (i in 1:length(files)) { 
        temp <- read.csv(files[i], header = TRUE)
        #  print(files[i])
        existingDF <- rbind(existingDF, temp)
    }
    df <- subset(existingDF, ID %in% id)    
    compCasesBoolean <- complete.cases(df)
    compCases <- df[compCasesBoolean,]
    solution <- ddply(compCases,"ID",nrow)
    colnames(solution) <- c("id","nobs")
    solution
}

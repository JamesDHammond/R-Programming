source("D:\\Coursera\\R-Programming\\corr.R")
source("D:\\Coursera\\R-Programming\\complete2.R")
cr <- corr("D:\\Coursera\\R-Programming\\specdata",threshold=150)
head(cr)
summary(cr)

cr <- corr("D:\\Coursera\\R-Programming\\specdata",threshold=400)
head(cr)
summary(cr)

cr <- corr("D:\\Coursera\\R-Programming\\specdata",threshold=5000)
head(cr)
summary(cr)

cr <- corr("D:\\Coursera\\R-Programming\\specdata")
head(cr)
summary(cr)
length(cr)
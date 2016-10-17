source ("D:\\Coursera\\R-Programming\\pollutantmean.R")
source ("D:\\Coursera\\R-Programming\\complete.R")
source ("D:\\Coursera\\R-Programming\\corr.R")
test <- round(pollutantmean("D:\\Coursera\\R-Programming\\specdata", "sulfate", 1:10), digits = 3)
test
# [1] 4.064
test <- round(pollutantmean("D:\\Coursera\\R-Programming\\specdata", "nitrate", 70:72), digits = 3)
test
#[1] 1.706
test <- round(pollutantmean("D:\\Coursera\\R-Programming\\specdata", "sulfate",  34), digits = 3)
test
#[1] 1.477
test <- round(pollutantmean("D:\\Coursera\\R-Programming\\specdata", "nitrate"), digits = 3)
test
#[1] 1.703
cc <- complete("D:\\Coursera\\R-Programming\\specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)
#[1] 228 148 124 165 104 460 232
cc <- complete("D:\\Coursera\\R-Programming\\specdata", 54)
print(cc$nobs)
#[1] 219


## this is wrong (had to add records with 0 in them)
set.seed(42)
#cc <- complete("D:\\Coursera\\R-Programming\\specdata", 332:1)
cc <- read.csv("D:\\Coursera\\R-Programming\\specdata\\test.csv",header=TRUE)
#cc
use <- sample(332, 10)
print(cc[use, "nobs"])
# 711 135 74 445 178 73 49 0 687 237

cr <- corr("D:\\Coursera\\R-Programming\\specdata")                
cr <- sort(cr)                
set.seed(868)  
out <- round(cr[sample(length(cr), 5)], 4)
print(out)
nobs
# [1] 0.2688  0.1127 -0.0085  0.4586  0.0447

cr <- corr("D:\\Coursera\\R-Programming\\specdata", 129)   
cr <- sort(cr)                
n <- length(cr)                
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)
# [1] 243.0000   0.2540   0.0504  -0.1462  -0.1680   0.5969

cr <- corr("D:\\Coursera\\R-Programming\\specdata", 2000)                
n <- length(cr)                
cr <- corr("D:\\Coursera\\R-Programming\\specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
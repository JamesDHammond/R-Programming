hw1=read.csv("hw1_data.csv")
hw1

x <- c(4, TRUE)
typeof(x)

x <- 1:4
y <- 2:3
x+y
z<-x+y
typeof(z)

hw1[1:2,]

nrow(hw1)

hw1[152:153,]

hw1[47,"Ozone"]

sum(is.na(hw1["Ozone"]))


mean(hw1$Ozone,na.rm=TRUE)


mean(hw1$Solar.R[hw1$Ozone>31 & hw1$Temp >90],na.rm=TRUE)

mean(hw1$Temp[hw1$Month==6],na.rm=TRUE)

max(hw1$Ozone[hw1$Month==5],na.rm=TRUE)

x <- 4L
class(x)

x <- c(4, "a", TRUE)
class(x)

x <- c(1,3, 5)
y <- c(3, 2, 10)
cbind(x,y)

x <- list(2, "a", "b", TRUE)
class(x)
z<-x[[1]]
class(x[[1]])


x <- 1:4
y <- 2
x+y
class(x+y)
z<-x+y
class(z[1])
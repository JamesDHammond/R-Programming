library(datasets)
data(iris)
?iris

iris

with(iris, tapply(Sepal.Length, Species, mean))
setosa versicolor  virginica 
5.006      5.936      6.588

7



library(datasets)
data(mtcars)

?mtcars

with(mtcars, tapply(mpg, cyl, mean))

with(mtcars, tapply(mpg, cyl, mean))
#4        6        8 
#26.66364 19.74286 15.10000 

sapply(split(mtcars$mpg, mtcars$cyl), mean)
#4        6        8 
#26.66364 19.74286 15.10000 

tapply(mtcars$mpg, mtcars$cyl, mean)
#4        6        8 
#26.66364 19.74286 15.10000 

tapply(mtcars$cyl, mtcars$mpg, mean)

tapply(mtcars$mpg, mtcars$cyl, mean)


mean(mtcars$hp, trim=0, na.rm=TRUE, mtcars$cyl==8)
-
mean(mtcars$hp, trim=0, na.rm=TRUE, mtcars$cyl==4)  

with(mtcars, tapply(hp, cyl, mean))

209.21429 - 82.63636

debug(ls)


ls

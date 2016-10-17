## These functions provide a means to retrive an already computed
## inverse of a square matrix or cache it if it has not previously
## been computed.
##
## These methods (functions) assume that the matrix supplied is invertible
## and no error checking is done for the failure to meet that condition

## This function provides the setter and getter methods (functions)
## that will set or get an inverse of a square matrix
makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setInverse <- function(solve) i <<- solve
    getInverse <- function() i
    list (set=set, get=get, setInverse=setInverse, getInverse=getInverse)
}


## method (function) that inverts a matrix. It will used a cache value, if it exists, 
## or computed it and then cache it if the value doesn't already exist
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    i <- x$solve
    if ( !is.null(i)){
        message("Getting Cached Inverse Matrix")
        return (i)
    }
    data <- x$get()
    i <- solve(data,...)
    x$setInverse(i)
    i
}

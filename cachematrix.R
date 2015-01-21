## Put comments here that give an overall description of what your
## functions do

## These are two functions used to create a special object that stores a matrix and cache's its inverse. 

## Write a short comment describing this function

## Creates a list of functions: (set value of matrix, get value of matrix, set value of inverse, get value of inverse)

makeCacheMatrix <- function(x = matrix()) {
	inv <- NULL
    set <- function(y) {
          x <<- y
          inv <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) inv <<- solve
    getinverse <- function() inv
    list(set = set, get = get, 
         setinverse = setinverse,
         getinverse = getinverse)
}

## Write a short comment describing this function

##Checks to see if inverse already in the cache. If so, returns it and stops running. If not, retrieves data i.e. the matrix, calculates the inverse and puts this in the cache. Then, returns inverse. 

cacheSolve <- function(x, ...) {
     ## Return a matrix that is the inverse of 'x'
     inv <- x$getinverse()
     if(!is.null(inv)) {
           message("getting cached data")
           return(inv)
     }
     data <- x$get()
     inv <- solve(data, ...)
     x$setinverse(inv)
     inv
}

## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix function return a list of functions to set and get a matrix
## and get and set the cached value of matrix inverse

makeCacheMatrix <- function(x = matrix()) {
##this function creates a special matrix object that can cache its inverse
    cache <- NULL
   # set and store a matrix
   setmatrix <- function(nv) {
	x <<- nv
   # since the matrix has a new value, the cache is flushed
        cache <<- NULL
   }
   # function returning the matrix
   getmatrix <- function() {
           x
   }
   # cache the given argument
   
   cacheinverse <- function(solve) {
           cache <<- solve
   }
   # return the cached value
   getinverse <- function() {
           cache
   }
   # return a list. Each named element of the list is a function
   list(setmatrix = setmatrix, getmatrix = getmatrix,
   cacheinverse = cacheinverse, getinverse = getinverse)
}

## the function CacheSolve calculate the inverse of the matrix created with
## function makeCacheMatrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	inverse <- x$getinverse()
	if (!is.null(inverse)){
	        message("getting cached data")
		return(inverse)
	}

	data <- x$getmatrix()
	inverse <- solve(data)
	x$cacheinverse(inverse)

	inverse

}

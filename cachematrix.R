## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## This function makes the matrix and sets the inverse just like the example with the mean given in the assignment.
## Similar to the makevector function. It creates a matrix instead of a numeric vector. 

makeCacheMatrix <- function(x = matrix()) {
  j <- NULL
  set <- function(y){
    x <<- y
    j <<- NULL
  }
  get <- function()x
  setInverse <- function(inverse) j <<- inverse
  getInverse <- function() j
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}



## Write a short comment describing this function

## Second script that returns a matrix that is the inverse of 'x', similar to the cachemean given in the example. 

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  j <- x$getInverse()
  if(!is.null(j)){
    message("getting cached data")
    return(j)
  }
  mat <- x$get()
  j <- solve(mat,...)
  x$setInverse(j)
  j
}

## In order to test the script we can create a simple matrix, and assign it to testmatrix:
testmatrix <- matrix(c(6,5,8,9),2,2)
testmatrix1 <- makeCacheMatrix(testmatrix)

## We can now test the cacheSolve function
cacheSolve(testmatrix1)

## To see if we get the "getting cached data" from our cacheSolve we can try and call it again.

cacheSolve(testmatrix1)

## The message from cacheSolve pops up in the console.  
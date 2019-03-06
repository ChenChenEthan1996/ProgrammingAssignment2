## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}




###### Solutions ######

# Create a matrix object that is able to cache its inverse
makeCacheMatrix <- function(x = matrix()) {
#      x:  a square invertible matrix
# return: a list containing functions to
#              1. set the matrix
#              2. get the matrix
#              3. set the inverse
#              4. get the inverse
#this list is used as the input to cacheSolve()
  invm <- NULL
  set <- function(y) {
    x <<- y
# use '<<-' to assign a value to an object in an environment 
# that is different from the current environment
    invm <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) invm <<- inverse
  getInverse <- function() invm
  list(set = set,
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


#Compute the inverse of the matrix returned by "makeCacheMatrix"
cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
  invm <- x$getInverse()
# if the inverse has already been calculated
  if (!is.null(invm)) {
# get it from the cache and skips the computation.
    message("getting cached data")
    return(invm)
  }
# otherwise, calculates the inverse  
  mat <- x$get()
  invm <- solve(mat, ...)
# sets the value of the inverse in the cache via the setinv function.
  x$setInverse(invm)
# Return the matrix
    invm
}

#Example for testing 
my_matrix <- makeCacheMatrix(matrix(1:4, 2, 2))
my_matrix$get()
my_matrix$getInverse()
cacheSolve(my_matrix)
cacheSolve(my_matrix)
my_matrix$getInverse()

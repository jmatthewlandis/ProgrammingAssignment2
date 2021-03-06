## these functions coordinate to check for a cached inverse of a matrix, or to
## create one if it hasn't been cached.

## makeCacheMatrix: creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  setMatrix <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  getMatrix <- function() x
  setInverse <- function(inverted) inverse <<- inverted
  getInverse <- function() inverse
  list(setMatrix = setMatrix, getMatrix = getMatrix, setInverse = setInverse,
       getInverse = getInverse)
}


## This function computes the inverse of the special "matrix" returned by 
## makeCacheMatrix above. If the inverse has already been calculated (and the 
## matrix has not changed), then the cachesolve should retrieve the inverse 
## from the cache.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inverse <- x$getInverse()
  if(!is.null(inverse)) {
    return(inverse)
  }
  matrix <- x$getMatrix()
  inverse <- solve(matrix, ...)
  x$setInverse(inverse)
  inverse
}

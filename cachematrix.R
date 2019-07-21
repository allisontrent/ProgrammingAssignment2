## These functions create objects that hold matrices, and caches the inverses.

## makeCacheMatrix creates a matrix object, sets and gets the value of the matrix, and then sets and gets the value of the inverse.

makeCacheMatrix <- function(x = matrix()) {
	i <- NULL
	set <- function(y) {
		x <<- y
		i <<- NULL
	}
	get <- function() x
	setinverse <- function(inverse) i <<- inverse
	getinverse <- function() i
	list(set = set, get = get, setinverse = setinverse, getinverse = 	getinverse)
}


## cacheSolve calculates the inverse of the matrix from the makeCacheMatrix function, or retrieves.

cacheSolve <- function(x, ...) {
	i <- x$getinverse()
	if(!is.null(i)) {
		message("getting cached data")
		return(i)
	}
	data <- x$get()
	i <- solve(data, ...)
	x$setinverse(i)
	i 
}

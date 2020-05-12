## Matrix inverse calculation is a tedious job especially if matrix contains more than 3 rows and columns. Storing a inverse valus for repeated usage may prove fruitful to avoid complexity.

## This function defines a special matrix which stores its inverse. Precisely the matrix is passed as a function in other environment and then its inverse is assigned in parent environment.

makeCacheMatrix <- function(x = matrix()) {
	I <- NULL
	set <- function(y){
		x <<- y
		I <<- NULL
		}
	get <- function(){
	x
	}
	setinverse <- function(inverse) I <<- inverse
	getinverse <- function (){
	I
	}
list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## This function firstly looks for any cached inverse value. If found it will return the inverse, else it will use solve() function to calculate the inverse.

cacheSolve <- function(x, ...) {
        I <- x$getinverse()
		if(!is.NULL(I)){
		message("getting cahced data")
		return(I)
		}
		N <- x$get()
		I <- solve(N, ...)
		x$setinverse(I)
		I
}

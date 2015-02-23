# HO.

# make a new cache matrix which is basically a list of four functions for:
# getting the matrix (get)
# setting the matrix (set)
# getting the inverse matrix (getinverse)
# setting the inverse matrix (setinverse)
makeCacheMatrix <- function( x = matrix() ) {
	inverse <- NULL
	
	set <- function( m ) {
		x <<- m
		inverse <<- NULL
	}
	
	get <- function() x
	
	setinverse <- function( im ) {
		inverse <<- im
	}
	
	getinverse <- function() inverse
	
	list( set = set, get = get, setInverse = setinverse, getInverse = getinverse )
}


## expects a list returned by a call to makeCacheMatrix and if the inverse matrix is not already cached,
# calculates the inverse, caches and returns it
cacheSolve <- function( x, ... ) {
        ## Return a matrix that is the inverse of 'x'
				inverse <- x$getInverse()
				
				if( !is.null( inverse ) ) {
					message( "getting cached matrix" )
					
					return( inverse )
				}
				
				inverse <- solve( x$get() )
				
				x$setInverse( inverse )
				
				inverse
}
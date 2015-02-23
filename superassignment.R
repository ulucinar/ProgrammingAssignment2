# HO.

# why we need the 'superassignment' operator:

cube_wrong <- function( x ) {
	result <- x * x
	
	multiply <- function() {
		result <- result * x		
		
		message( result )

		result
	}
	
	multiply()
	
	result
}

cube_right <- function( x ) {
	result <- x * x
	
	multiply <- function() {
		result <<- result * x		
	}
	
	multiply()
	
	result
}
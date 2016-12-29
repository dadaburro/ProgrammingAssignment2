## This code contains two functions that takes advantage of the lexical scoping functionality in R.
## The first function takes the argument from the user and creates a matrix to be cached and used later by the second function.


## This function creates takes a matrix as argument and sorts a list of functions to be used by the cacheSolve function.
makeCacheMatrix <- function(x = matrix()) {
 m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) m <<- solve
    getsolve <- function() m
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}


## This function takes the makeCacheMatrix as argument, retrieves ints functions and returns the cached inverse matrix.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
            m <- x$getsolve()
    if(!is.null(m)) {
        message("Yey! cached inverted matrix!")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setsolve(m)
    m
}

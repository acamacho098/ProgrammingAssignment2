## the following two functions are being used to cache the inverse of
## a matrix. It is much faster to do this then to loop through it
## and compute it individually 

## Write a short comment describing this function
## set value of matrix
# get value of the matrix
#set value of inverse
#get the value of inverse

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set<- function(y){
      x<<-y
      i <<- NULL
}
    get<- function() x
    setinverse <- function(inverse) i <<- inverse
    getinverse <- function() i
    list(set = set,
         get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## function assuemes that the matrix is always invertable 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is t  he inverse of 'x'
    inv<- x$getinverse()
    if(!is.null(inv)){
      message ("getting cached data.")
      return(inv)
    }
    data <- x$get()
    inv<- solve(data)
    x$setinverse(inv)
    inv
}

##test
x = rbind(c(1, 5), c(5,1))
m = makeCacheMatrix(x)
m$get()

cacheSolve(m)


makeCacheMatrix <- function(x = matrix()) {
  m <- NULL               
  set <- function(y){
     x <<- y             #assign input arg to x in parent environment
     m <<- NULL          #clears cache
  }
get<-function() x        #uses lex scop, retrieves x from parent
setmatrix<-function(solve) m<<- solve
getmatrix<-function() m
list(set=set, get=get,
   setmatrix=setmatrix,
   getmatrix=getmatrix)
}

cacheSolve <- function(x=matrix(), ...) {
    m<-x$getmatrix()
    if(!is.null(m)){
      message("getting cached data")
      return(m)
    }
    datos<-x$get()
    m<-solve(datos, ...)
    x$setmatrix(m)
    m
}




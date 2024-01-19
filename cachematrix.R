## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  #定义一个函数"MakeVector",它接受一个默认值为空的参数“x"，这个参数是一个数值变量。在函数内部，创建一个局部变量”m",
  ##并初始化为“NULL",这个”m“将用来储存向量的逆向量
  m<-NULL
  #‘set'方法，接受一个参数y,将全局变量x的值设置为y，然后将m设置为NULL，这个方法的目的是设置
  #向量的新值，并在设置后重置平均值
  set<-function(y){
   x<<-y
   m<<-NULL
 }
  #get方法，返回全局向量x的当前值，用于获取向量的当前值
  get<-function()x
  #第三个方法，成为setmean，接受一个参数mean,将全局向量m的值设置为mean，这个方法的目的是设置向量的逆向量
  setInverse<-function(inverse)m<<-inverse
  #第四个方法，返回全局向量m的当前值，即向量的平均值
  getInverse<-function()m
  #返回列表
  list(set=set,get=get,setInverse=setInverse,getInverse=getInverse)
}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
 #获取逆向量
  m<-x$get()
 #判断
  if(!is.null(m)){
   print("getting cached inverse matrix")
   return(m)
 }
 mat<-x$get()
 m<-solve(mat)
 x$setInverse(m)
 m
}

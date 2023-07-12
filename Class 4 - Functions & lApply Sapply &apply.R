#Descriptive Analyticis tells what has happened in the past)
# lapply(), sapply(), apply(), tapply(), aggregate(), split()
#in order to understand this func, we need to create a list

wgt=c(45,90,66,28,80,64)
hgt=c(154,161,160,150,155,152)
salary=c(2500,3080,5000,4500,3000,2400)
list1=list(wgt,hgt,salary)
list1
list1[[3]][4]

#Finding mean for the vectors inside the list
#lapply is used to perform a function for the list.
#Syntax: "lapply(list_name, function)". it returns a list only.
class(lapply(list1, mean))
lapply(list1, sum)
class(sapply(list1, mean)) #same as lapply, diff is that it returns result in form of a vector

head(iris)
lapply(iris[1:4], mean)  #similar to colMeans(iris[1:4]). colmeans returns vector. lapply returns a list

#tapply is always applied in dataframe
tapply(iris$Sepal.Length, iris$Species, mean) #
tapply(iris$Sepal.Width, iris$Species, mean)
tapply(iris$i, iris$Species, mean)
for(i in 1:4) {
  print(tapply(iris[,i], iris$Species, mean))  #iris[,i]
}

#apply can be applied on any 2 dim data
mat=matrix(1:9,3)
mat
apply(mat, 1, mean)   #1 for row & 2 for column
apply(mat, 2, mean)
apply(iris[1:4], 1, mean)
apply(iris[1:4], 2, sd)



#User defined function in R

#Sum of first n no.s
sum_of_firstn_nos=function(n) {
  res=(n*(n+1))/2
  return(res)
}
sum_of_firstn_nos(10)

#Sum of square of first n no.s
sum_sq=function(n1) {
  res1=(n1*(n1+1)*((2*n1)+1))/6
  return(res1)
}
sum_sq(3)
sum_sq(10)





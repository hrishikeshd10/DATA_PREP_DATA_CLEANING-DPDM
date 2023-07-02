#Initialise n array of n elements with 0
#USSAGE OF FOR LOOP IN R
var = numeric(10)
var[1] = var[2]  = 1
for (i in 3:10){
  var[i] = var[i-1] + var[i-2]
  print(var[i])
} 
print(var)

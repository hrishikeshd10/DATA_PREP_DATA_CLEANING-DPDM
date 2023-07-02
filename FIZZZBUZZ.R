# #FIZZBUZZ
# #Write a R program to print the numbers from 1 to 100 and print
# "Fizz" for multiples of 3,
# print "Buzz" for multiples of 5, and print
# "FizzBuzz" for multiples of both.

fizzbuzz = function(){
  list1 = seq(1:100)
 
  for (number in list1){
   
    if(number %% 3 == 0 ){
      if(number %% 5 != 0){
        print( paste(number," is ", "FIZZ"))
      }else{
        print( paste(number," is ", "FIZZBUZZ"))
      }
    
    } 
    else if(number %% 5 == 0 ){
      if(number %% 3 != 0){
        print( paste(number," is ", "BUZZ"))
      }else{
        print( paste(number," is ", "FIZZBUZZ"))
      }
      
    }
  }
  
}
fizzbuzz()

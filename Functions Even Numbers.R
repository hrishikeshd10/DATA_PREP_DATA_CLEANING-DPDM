#FUNCTIOnS IN R
# <function_name> = function(<params>){}
evenNumbers = function(limit){
  if(limit >= 2){
    print("Hrishikesh")
    sequence = seq(2:limit)
    for (number in sequence){
      if(number %% 2 == 0){
        print(number)
      }
    }
    
    
    
    
  }else{
    stop("The minimum number should be atleast 2!")
  }
}

 
evenNumbers(10)

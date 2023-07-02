# R PROGRAM TO FIND FACTORS OF A NUMBER

factors = function(number){
  for (divisor in 1:number){
    if(number %% divisor == 0){
      print(paste(divisor, "is a Factor of ", number))
    }
  }
  
}
factors(100)
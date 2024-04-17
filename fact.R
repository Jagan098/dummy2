num<-as.integer(readline())
factorial=1
if(num<0){
  print(paste("Factorial does not exists"))
}else if(num==0){
  print(paste("Factorial of 0 is 1"))
}else{
  for(i in 1:num){
  factorial=factorial*i
  }
  print(paste("Factorial of given number is :",factorial))
}
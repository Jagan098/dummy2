num<-as.integer(readline())
num1=0
num2=1
count=2
if(num<=0){
  print("Enter a positive number")
}else if(num==1){
  print("Fibonacci series:")
  print(num1)
}else{
  print("Fibonacci series:")
  print(num1)
  print(num2)
  while(count<num){
    nxt=num1+num2
    print(nxt)
    num1=num2
    num2=nxt
    count=count+1
  }
}

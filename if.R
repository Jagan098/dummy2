x<-as.integer(readline())
y<-as.integer(readline())
z<-as.integer(readline())
if(x>y && x>z){
  print(paste("greater number is:",x))
}else if(y>z){
  print(paste("greater number is:",y))
}else{
  print(paste("greater number is:",z))
}
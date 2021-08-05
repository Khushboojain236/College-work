#Answer 1
final_result<-0
for(m in 1:200){
result<-0
for(i in 1 : 10000){
  x<-c(1,2,3,4,5,6)
  time_is<-0
  while(length(x)!=0)
  {
    x1<-sample(1:6,1,T)
    x <- x[x!= x1]
    time_is<-time_is+1
  }
   result<-result+time_is
}
final_result<-final_result+(result/10000)
}
final_result/200

#Answer 2 
x_axis<-c(6,7,8,9,10)
final_vector<-c()
for(k in 6 :10){
  final_result<-0
  for(x in 1:200){
    result <- 0
    for ( i in 1:10000){
      x1<-sample(1:k,k,F)
      x2<-sample(1:k,k,F)
      flag <- 1
      for(m in 1:k)
      {
        if (x1[m]==x2[m])
        {
          flag <- 0
        }
      }
      result <- result + flag
    }
    final_result<-final_result+(result/10000)
  }
  final_result<-final_result/200
  final_vector<-append(final_vector,final_result)
}
final_vector
plot(x_axis,final_vector)

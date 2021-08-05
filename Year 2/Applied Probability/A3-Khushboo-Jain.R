#Queestin 1
x_axis<-c(2,3,4,5)
final_vector<-c()
for(k in 2 :5){
  final_result<-0
  for(x in 1:200){
    result <- 0
    for ( i in 1:10000){
      y_rexp <- rexp(k, rate = 1/24000) 
      T1 <- y_rexp[1]
      T<-T1
      for(i in 2:k)
      {
        T= T+y_rexp[i]
      }
      P<- (T1/T) * 100
      result= result+ P
    }
    result_p<-result/10000
    final_result= final_result + result_p
  }
   final_result<- final_result/200
   final_vector<-append(final_vector,final_result)
}
# the final_vector along Y axis is % 
final_vector
plot(x_axis,final_vector)

 #Question 2 
final_result<-0
for(m in 1:200){
  result<-0
  largest_p<-0
  largest_sd
  for(i in 1 : 10000){
    var<-i/1000
    sd<-sqrt(var)
    p<-pnorm(2,0,sd)-pnorm(1,0,sd)
    if(p>largest_p){
      largest_p <- p
      largest_sd <- sd
    }
  }
  largest_variance<-largest_sd^2
  final_result=final_result+largest_variance 
}
value<-final_result/200
value
largest_p


    
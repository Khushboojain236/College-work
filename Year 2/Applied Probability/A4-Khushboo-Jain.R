#Question 1
final_result<-0
for(m in 1:200){
  result<-0
  beta<-2/6
  lambda_e<-2/6
  for(i in 1 : 10000){
   time_e <- rexp(1, rate = lambda_e) 
   lambda_p<-beta*time_e
   p<-ppois(2,lambda_p)
   result=result+p
  }
  result_p=result/10000
  final_result=final_result+result_p
}
final_result/200

#Question 2
x_axis<-c(1,2,3,4,5)
e_y<-c()
for(a in 1 :5){
  final_result<-0
  for(x in 1:200){
    result <- 0
    for ( i in 1:10000){
      x<-runif(1,min=0,max=a)
      if(x<(a/2)){
        p<-x
      }
      else {
        p<-(a/2)
      }
      result<-result + (p)
    }
    final_result<-final_result+(result/10000)
  }
  final_result<-final_result/200
  e_y<-append(e_y,final_result)
}
e_y
plot(x_axis,e_y)
  

    
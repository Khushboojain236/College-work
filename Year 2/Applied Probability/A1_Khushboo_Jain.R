install.packages("numbers")
library(numbers)
# install.library(numbers)
result<-0
for(m in 1 :200){
sum <-0
  
  for(i in 1 : 10000){
    x1<-sample(1:1000000000,1,T)
    x2<-sample(1:1000000000,1,T)
   if (coprime(x1,x2)==TRUE){
      sum <- sum + 1
   }
  }
  result<-(sum/10000)+result
}
  result/200
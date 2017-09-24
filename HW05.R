# R class HW05
# 自訂standard deviation函數
my_length <- function(vec){
  cnt <- 0
  for(i in vec){
    cnt <- cnt + 1  #計算迴圈跑了幾次
  }
  return(cnt)
}

my_sum <- function(vec){
  sum <- 0
  for(i in vec){
    sum <- sum + i  #將vec每個元素加起來
  }
  return(sum)
}

my_mean <- function(vec){
 mean <- my_sum(vec) / my_length(vec)  #每個元素加總除以個數
 return(mean)
}

my_sd <- function(vec){
  summation <- 0
  summation <- my_sum((vec - my_mean(vec))^2)  #將vec的每個元素減掉vec的平均後取平方再加總
  sd <- (1 / (my_length(vec) - 1) * summation)^(1 / 2)  #標準差公式
  return(sd)
}

vec_test <- round(runif(1000000)*100)
my_sd(vec_test)  #自訂的sd函數
sd(vec_test)  #R語言內建的sd函數
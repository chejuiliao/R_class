# R class 8_2017/09/23
# Fibonacci sequence
# Way 1
f_1 <- 0
f_2 <- 1
sum <- c(f_1, f_2)
i = 3

while (i <= 20) {
  sum[i] <- sum[i - 1] + sum[i - 2]
  i <- i + 1
}
sum

# Way 2
f_1 <- 0
f_2 <- 1
fib <- c(f_1, f_2)

while (length(fib) < 20) {  #向量長度等於20時停止迴圈
  f_3 <- f_1 + f_2
  fib <- c(fib, f_3)  #在向量裡加入f_3
  f_1 <- f_2  #將f_1平移
  f_2 <- f_3  #將f_2平移
}
fib

# R語言的計算速度：向量計算 > apply()函數家族 > for/while迴圈
heights <- runif(500000) * 50 + 140
weights <- runif(500000) * 50 + 40
h_w_df <- data.frame(heights, weights)
# Way 1 : vector calculation
system.time(
  h_w_df$BMI <- weights / (heights / 100)^2
)

# Way 2 : mapply function
bmi_calculator <- function(weight, height) {
  bmi <- weight / (height / 100)^2
  return(bmi)
}
system.time(
  bmi <- mapply(FUN = bmi_calculator, h_w_df$weights, h_w_df$heights)  #mapply可以將函數用到矩陣上
)
h_w_df$BMI <- bmi

# Way 3 : for/while loop
bmi <- c()
system.time(
  for(i in 1:nrow(h_w_df)){
  bmi[i] <-  h_w_df$weights[i] / (h_w_df$heights[i] / 100)^2
  }
)

# apply函數家族，每個apply函數僅能解決特定問題
apply(cars, MARGIN = 1, FUN = sum)  #把sum好函數應用到cars的每個row
# 等同於以下式子
cars$speed + cars$dist

apply(cars, MARGIN = 2, FUN = sum)  #把sum好函數應用到cars的每個column

lapply(cars, FUN = sum)  #回傳list
lapply(cars, FUN = sum)$speed

unlist(lapply(cars, FUN = sum))  #unlist可以將list解構成有命名的向量(可用名字存取裡面的元素)
unlist(lapply(cars, FUN = sum))["speed"]

sapply(cars, FUN = sum)  #回傳vector

tapply(iris$Sepal.Length, iris$Species, FUN = mean)  #可以根據群組來應用函數，但dyplr可用group_by做到一樣的事

# 自訂函數
circle.calculate <- function(r, is_area = TRUE) {  #將is_area參數的預設值設為TRUE，也可以不設預設值，但呼叫時就必須輸入參數
  if(is_area == TRUE){
    area <- pi * r^2
    return(area)
  }else{
    circum <- 2 * pi * r
    return(circum)
  }
}

circle.calculate(3, is_area = TRUE)

circle.calculate <- function(r) {
  area <- pi * r^2
  circum <- 2 * pi * r
  circle_list <- list(
    area = area,
    circum = circum
    )
  return(circle_list)  #回傳一個list
}

circle.calculate(3)  #可以同時得到area和circum

# 自訂mean函數
my_length <- function(x){
  cnt <- 0
  for(i in x){
   cnt <- cnt + 1
  }
  return(cnt)
}

my_sum <- function(x){
  my_sum <- 0
  for(i in 1:my_length(x)){
    my_sum <- my_sum + x[i]
  }
return(my_sum)
}
 
my_mean <- function(x){
  my_mean <- my_sum(x) / my_length(x)
  return(my_mean)
}

my_mean(c(1, 5, 7))

# 質因數分解
is_prime <- function(x){
  i <- 2
  while(i <= (x / 2)){
    if(x %% i == 0){
      return(FALSE)
    }
    i <- i + 1
  }
  return(TRUE)
}

#計算範圍內有幾個prime
count_primes <- function(start_num, end_num){
  is_prime_vec <- c()
  for(i in start_num:end_num){
    is_prime_result <- is_prime(i)  #判斷是否為prime
    is_prime_vec <- c(is_prime_vec, is_prime_result)  #將結果儲存
  }
  ans <- sum(is_prime_vec)  #加總即知道TRUE有幾個(TRUE = 1)
  return(ans)
}


# 計算質因數個數（練習）
count_prime_factors <- function(x){
  cnt <- 0
  temp <- x
  for(n in 2:x){
    if(temp == 1 | n > x){
      break
    }else if(is_prime(n) == TRUE & temp %% n == 0){
        temp <- temp / n
        cnt <- cnt + 1
      }
    }
  return(cnt)
}
count_prime_factors(2)
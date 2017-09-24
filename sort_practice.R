# There are selection sort, exchange sort, bubble sort, and quick sort

selection_sort <- function(vec, ascending = TRUE){
  i <- 1
  while(i < length(vec)){
    j <- i + 1
    min <- vec[i]  #預設第i個值為最小
    temp_idx <- i  #暫存最小值的位置
    while(j <= length(vec)){
      if(vec[j] < min){  #如果j的值比最小值小，最小值換成j
        min <- vec[j]   #將最小值換為j的值
        temp_idx <- j  #將最小值的位置換為j
      }
      j <- j + 1
    }
    vec[temp_idx] <- vec[i]  #將i換到原本最小值的位置
    vec[i] <- min  #將最小值放到i
    i <- i + 1
  }
  if(ascending == TRUE){
    return(vec)
  } else{
    vec_rev <- c()
    for(i in length(vec):1){
      vec_rev <- c(vec_rev,vec[i])
    }
    return(vec_rev)
  }
}

exchange_sort <- function(vec, ascending = TRUE){
  for(i in 1:(length(vec) - 1)){
    for(j in (i + 1):length(vec)){
      if(vec[j] < vec[i]){  #如果j比i小，j和i對調
        temp <- vec[i]
        vec[i] <- vec[j]
        vec[j] <- temp
      }
    }
  }
  
  if(ascending == TRUE){
    return(vec)
  } else{
    vec_rev <- c()
    for(i in length(vec):1){
      vec_rev <- c(vec_rev,vec[i])
    }
    return(vec_rev)
  }
}

bubble_sort <- function(vec, ascending = TRUE){
  j <- length(vec)
  while(j > 1){
    for(i in 1:(j - 1)){
      if(vec[i] > vec[i + 1]){
        temp <- vec[i + 1]
        vec[i+ 1] <- vec[i]
        vec[i] <- temp
      }
    }
    j <- j - 1
  }
  
  if(ascending == TRUE){
    return(vec)
  } else{
    vec_rev <- c()
    for(i in length(vec):1){
      vec_rev <- c(vec_rev,vec[i])
    }
    return(vec_rev)
  }
} 

quick_sort <- function(vec, ascending = TRUE){
  mid <- sample(vec, size = 1)
  left <- c()
  right<- c()
  for(i in vec){
    if(i < mid){
      left <- c(left, i)
    } else if(i > mid){
      right <- c(right, i)
    }
  }
  
  if(length(left) > 1){
    left <- quick_sort(left)
  }
  
  if(length(right) > 1){
    right <- quick_sort(right)
  }
  
  vec <- c(left, mid, right)
  if(ascending == TRUE){
    return(vec)
  } else{
    vec_rev <- c()
    for(i in length(vec):1){
      vec_rev <- c(vec_rev, vec[i])
    }
    return(vec_rev)
  }
}
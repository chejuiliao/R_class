#2017/10/12  問卷除錯程
#需確認今年資料和去年資料的欄位名稱是否有調整，尤其是"統編"，在excel內調為一致
#需檢查數字欄位是否有參雜文字（特別是統編）
#紅色標記為需調整的行數

file_path_now <- "C:/Users/PC407C/Desktop/陸資_test.csv"  #今年資料的路徑
data_now <- read.csv(file_path_now, header = TRUE, sep = ",", stringsAsFactors = FALSE)
file_path_past <- "D:/2015投審會(調查2014)/中華徵信所寄來的原始資料/陸資.csv"  #去年資料的路徑
data_past <- read.csv(file_path_past, header = TRUE, sep = ",", stringsAsFactors = FALSE)

unit_now = 1000  #今年的單位
unit_past = 1000  #去年的單位
unit_adjust = unit_past / unit_now  #單位調整(將去年轉換為今年單位)

binary_search <- function(x, vec){  #binary search
  found = FALSE
  high = length(vec)
  low = 1
  idx = NA
  while (high >= low){
    mid = as.integer((high + low) / 2)
    if(x > vec[mid]){
      low = mid + 1
    } else if(x < vec[mid]){
      high = mid - 1
    } else{
      found = TRUE
      idx = mid
      break
    }
  }
  
  return(list(found = found, idx = idx))   #回傳是否找到及找到的位置
}

#只留下需要的資料(填數字的欄位)
i = 1
while(i <= ncol(data_now)){
  if(class(data_now[, i]) != "integer" & class(data_now[, i]) != "numeric"){  #排除非數字的欄位
    data_now[, i] <- NULL
  } else if(max(data_now[, i], na.rm = TRUE) < 2500){  #排除數字小的欄位(百分比、日期等)
    data_now[, i] <- NULL
  } else {
    i <- i + 1
  }
}
View(data_now)
data_past <- data_past[, (names(data_past) %in% names(data_now))] #過去的資料留下和現在一樣的欄位
data_now <- data_now[order(data_now[, 1]),]  #以id排序data_now，這樣才能用binary search
data_past <- data_past[order(data_past[, 1]),]  #以id排序data_past，這樣才能用binary search


no_zero <- replace(data_now, data_now == 0, NA)  #將0轉為NA，因為0無法取log
no_zero <- replace(no_zero, no_zero < 0, NA)  #將負數轉為NA，因為負數無法取log
log <- matrix(nrow = nrow(data_now), ncol = ncol(data_now) - 1)
log <- log10(no_zero[, -1])  #取log讓資料較皆近常態分布，data_now第一個column為統編，故不取
View(log)

data_past[, -1] <- round(data_past[, -1] * unit_adjust  / 1000, digits =  0) #將去年資料除了id欄位都調整為今年單位再除100萬，讓數字變小
data_now[, -1] <- round(data_now[, -1]  / 1000, digits = 0)

#檢查是否讀進的資料有誤
ncol(data_now) == ncol(data_past)   #若兩個的欄位數不相等則需檢查是否變數名稱有更動，需調整為一致
View(data_now)  #看"資產總額"在哪一欄
asset <- data_now[c(1, 6)]  #將資料的"統編"及"資產總額"欄位存入asset
rev <- data_now[c(1, 7)]  #將資料的"統編"及"營業收入"欄位存入rev

hi_result <- matrix(nrow = nrow(log), ncol = ncol(log))  #開一個空白矩陣來儲存結果

for(j in 1:ncol(log)) {  #對每個欄位依照Hampel Identifier法取出outlier
  hi <- (log[, j] - median(log[, j], na.rm = TRUE)) / (mad(log[, j], na.rm = TRUE)/0.6745)  #Hampel Identifier
  hi_result[, j] <- c(which(hi > 2.24), rep(NA, nrow(hi_result) - length(which(hi > 2.24))))  #將沒數值的部份補上NA
}
colnames(hi_result) <- colnames(data_now[, -1])  #將data_now的欄位名稱存入hi_result的欄位名稱，data_now第一欄為統編
View(hi_result)

result <- matrix(nrow = nrow(hi_result), ncol = ncol(hi_result))  #空白矩陣存最終結果

for(j in 1:ncol(result)){
  for(i in 1:nrow(result)){
    if(is.na(hi_result[i, j]) == TRUE){  #若hi_result內是NA則跳過
      next
    }else{
      idx <- hi_result[i, j]
      if((is.na(asset[idx, 2]) == FALSE & data_now[idx, j + 1] > asset[idx, 2]) | (is.na(rev[idx, 2]) == FALSE & data_now[idx, j + 1] > rev[idx, 2])){ #若該欄位大於營收或資產總額
        result[i,j] <- paste(data_now[idx, 1], data_now[idx, j + 1], asset[idx, 2], rev[idx, 2])
        print(paste(data_now[idx, 1], data_now[idx, j + 1], asset[idx, 2], rev[idx, 2]))
      }
      print(i)
      print(j)
      if(binary_search(data_now[idx, 1], data_past[, 1])$found){  #檢查該id去年是否有填
        k <- binary_search(data_now[idx, 1], data_past[, 1])$idx  #將之前資料的index存到k
        if(is.na(data_past[k, j + 1]) == FALSE & data_past[k, j + 1] != 0){  #要比較的欄位不是NA或0
          if(abs(data_now[idx, j + 1] / data_past[k, j + 1]) > 9 & data_now[idx, j + 1] > asset[idx, 2]){  #今年的資料比去年大9倍，因為若是誤key數字通常會多1位數以上
            result[i,j] <- paste(data_now[idx, 1], data_now[idx, j + 1], data_past[k, j + 1], asset[idx, 2], rev[idx, 2])  #將有問題的廠商統編、今年的答案、去年的答案，存到result
          }
        }
      }
    }
  }
}

colnames(result) <- colnames(data_now[,-1])
View(result)

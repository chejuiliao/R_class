#用baseplot，用2x2的網格畫4個圖
url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-white.csv"
whitewine <- read.table(url, header = TRUE, sep = ";")  #讀取whitewine資料
par(mfrow = c(2, 2))  #將畫布切成4塊


correlation <- matrix(data = 0, nrow = ncol(whitewine), ncol = ncol(whitewine))  #開一個矩陣儲存whitewine各變數間的相關係數
j <- 1
while(j <= ncol(whitewine)){
  i <- 1
  while(i <= ncol(whitewine)){
    if(i == j){  #自己和自己比的時候跳過，這樣比較好抓最大值跟最小值
      i <- i + 1
    }else{
      correlation[j, i] <- cor(whitewine[,j], whitewine[,i])
      i <- i + 1
      }
  }
  j <- j + 1
}
max(correlation) > abs(min(correlation))  #看正相關性最大的和負相關性最大的哪個相關性大
which(correlation == max(correlation), arr.ind = TRUE)  #看正相關性最大的是哪兩個變數
plot(whitewine[,4], whitewine[,8], xlim = c(0, 20), ylim = c(0.98, 1.01), xlab = "residual.sugar", ylab = "density", main = "relationship between sugar and density", col = whitewine$quality)  #畫兩個相關性最高的變數的散佈圖


plot(AirPassengers, main = "Number of Passengers", las = 1)


hist(whitewine$quality, main = "Quality Frequency", xlab = "quality", las = 1)


assault_ordered <- USArrests[order(USArrests$Assault), ]  #以Assault排序USArrests
states <- row.names(assault_ordered)  #將rowname存入states
bplt <- barplot(names.arg = states, height = assault_ordered$Assault, horiz = TRUE, las = 1, cex.names = 0.5, main = "Number of Assaults in USA", xlim = c(0, 380))  #畫出長條圖
text(y = bplt, x = assault_ordered$Assault + 2, labels = assault_ordered$Assault, cex = 0.5, pos = 4, col = "red")  #加上資料標籤

#HW03
#用ggplot2，用2x2的網格畫4個圖
library(ggplot2)
#圖1
animals <- c(rep("cat", 3), rep("dog", 3), rep("lion", 3), rep("elephant", 3))
condition <- rep(c("normal", "stress", "relax"), 4)
birth <- abs(rnorm(12, 3, 6))
data <- data.frame(animals, condition, birth)
gg1 <- ggplot(data, aes(x = animals, y = birth, fill = condition)) +
  geom_bar(stat = "identity", position = "fill")

#圖2
gg2 <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, xmax = max(Sepal.Length) * 1.2, ymax = max(Sepal.Width) * 1.2, color = Sepal.Length)) +
  geom_point(alpha = 0.6) +
  geom_text(label = iris$Species, nudge_x = 0.25, nudge_y = 0.25, check_overlap = TRUE) +
  theme(legend.position = "none")  #把legend拿掉
gg2
?aes
#圖3
data <- LifeCycleSavings
gg3 <- ggplot(data, aes(x = pop75, y= sr, fill = dpi, xmax = max(pop75) * 1.2, ymax = max(sr) * 1.2)) +
  geom_label(label = rownames(data), color = "white", size = 2) +  #將資料點用標籤形式表達
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  theme(legend.position = c(1, 1), legend.justification = c(1, 1))  #將legend放到圖里的右上角
gg3

#圖4
library(tidyverse)
day <- Sys.Date() - 0:364
value <- runif(365) + seq(-140, 224)^2 / 10000
data <- data.frame(day, value)
data$month <- as.Date(cut(day, breaks = "month"))  #日期的部分只留下年月
data <- group_by(data, month)  #將month欄位相同的觀測值群組起來
data <- summarise(data, average = mean(value))  #將群組的值計算平均，並存出一個新的dataframe
gg4 <- ggplot(data, aes(x = month, y = average)) +
  geom_line() +
  geom_point() +
  scale_x_date(date_labels = "%b-%Y", date_breaks = "1 month") +  #對資料結構為Date的x軸做設定
  theme(axis.text.x = element_text(angle = 60, hjust = 1))  #更改x軸的標籤顯示
  
#同時畫出4張圖
library(gridExtra)
grid.arrange(gg1, gg2, gg3, gg4, nrow = 2, ncol = 2)
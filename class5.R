#R class 5_2017/09/06
x <- seq(from = -5, to = 5, by = 0.1)
y <- x^3
plot(x, y, type = "n")  #把上下界框出來，但不畫點
plot(x, y, type = "n", xaxt = "n", yaxt = "n")  #把x, y軸都拿掉
plot(x, y, type = "n", xaxt = "n", yaxt = "n", xlab = "", ylab = "")  #把x, y軸標籤清空
y[y >= 0]  #篩選出>=0的點
x[y >= 0]  #篩選出>=0的點的x座標
points(x[y < 0], y[y < 0], col = "blue")  #將小於0的部分畫成藍色的點
lines(x[y >= 0], y[y >= 0], col = "red", lwd = 3)  #將大於0的部分畫成紅色的線
title("y = x^3")  #加上標題

#散佈圖，作用：x, y為連續型變數，看x, y的關聯
plot(cars)  #plot會根據data自動產生最適合的圖
plot(iris)
plot(EuStockMarkets)

plot(cars$speed, cars$dist, main = "Cars DataFrame", xlab = "Speed", ylab = "Distance")
lm_fit <- lm(formula = dist ~ speed, data = cars)  #目標變數為dist
abline(lm_fit, lwd = 2, col = "red")  #用直線畫出lm_fit

#Line：x為DateTime(日期+時間), y為numeric，看數值和時間的關係
?strptime
Sys.Date()  #Date
Sys.time()  #DateTime
format(Sys.time(), "%H:%M:%S") #Time

temperature <- round(runif(30) * 10 + 25)
dates <- as.Date("2017-06-01"):as.Date("2017-06-30")
dates <- as.Date(dates, origin = "1970-01-01")
plot(x = dates, y = temperature, type = "l", ylim = c(20, 40))

dates <- as.Date("2017-08-01"):as.Date("2017-08-31")  #產生8/1-8/31的日期，為整數
dates <- as.Date(dates, origin = "1970-01-01")  #將1970-01-01設為原點，才能得到2017-08-01~2017-08-31
temperature <- runif(31)  #產生31組介於0-1的隨機數
temperature <- round(runif(31) * 10 + 25)
plot(dates, temperature, type = "l", ylim = c(15, 40))

#直方圖(Hist)：x為numeric，只有一個變數的狀況，常用於描繪次數分配表(Frequency Table)
round(runif(10) * 10)
set.seed(87)  #將隨機種子設在87，之後也設87會得到一樣的數字
hist(round(runif(10) * 10))
set.seed(87)  #將隨機種子設在87，之後也設87會得到一樣的數字
hist(runif(100000))
hist(runif(100000), breaks = 10)  #分成10個箱
?rnorm  #隨機產生常態分佈數列

#盒鬚圖(Boxplot)：x為character或factor, y為numeric，變數分類別展開
str(iris)
par(mfrow = c(2, 2))
boxplot(iris$Sepal.Length ~ iris$Species, main = "Sepal length by species")
boxplot(iris$Sepal.Width ~ iris$Species, main = "Sepal width by species")
boxplot(iris$Petal.Length ~ iris$Species, main = "Petal length by species")
boxplot(iris$Petal.Width ~ iris$Species, main = "Petal width by species")

#curve可直接描繪函式，不用給出資料點
curve(sin, from = -pi, to = pi)  #用curve畫只需給函數、範圍
x <- seq(-pi, pi, by = 0.01)
y <- sin(x)
plot(x, y, type = "l")
grid()  #加上格線

sigmoid_func <- function(x){
  return(1 / (1 + exp(-x)))
}  #把所有輸入映射到0-1
curve(sigmoid_func, from = -10, to = 10)
abline(h = 0.5, lty = 2)  #在y = 0.5畫水平線
abline(v = 0, lty = 2)  #在x = 0畫垂直線

#長條圖(bar)：主要用於計數(類別count)、類別的數值
View(mtcars)
class(mtcars$cyl)
as.factor(mtcars$cyl)  #看出cyl只有3種值
table(mtcars$cyl)  #計算cyl每個值的次數
barplot(table(mtcars$cyl))  #用長條圖看計數
barplot(names.arg = row.names(mtcars), height = mtcars$hp)

vehicle <- row.names(mtcars)
barplot(names.arg = vehicle, height = mtcars$hp, horiz = TRUE, las = 1, cex.names = 0.5, main = "Horse power of each vehicle", xlab = "Horse power")  #horiz控制圖形方向，las控制變數值的方向，cex.names控制名稱大小
?order
?sort
my_vec <- c(10, 15, 12)
sort(my_vec)  #直接排序資料
order(my_vec)  #得到資料數字的排序值
my_vec[order(my_vec)]  #將排序值放入索引值即可排序
mtcars_ordered <- mtcars[order(mtcars$hp), ]  #以hp來排序整個dataframe
View(mtcars_ordered)
vehicle <- row.names(mtcars_ordered)
barplot(names.arg = vehicle, height = mtcars_ordered$hp, horiz = TRUE, las = 1, cex.names = 0.5, main = "Horse power of each vehicle", xlab = "Horse power", xlim = c(0, 380))  #按照馬力大小畫出圖
?text
bar_plt <- barplot(names.arg = vehicle, height = mtcars_ordered$hp, horiz = TRUE, las = 1, cex.names = 0.5, main = "Horse power of each vehicle", xlab = "Horse power", xlim = c(0, 380))  #把圖存成物件
bar_plt
text(y = bar_plt, x = mtcars_ordered$hp + 10, labels = mtcars_ordered$hp, cex = 0.5, pos = 4)  #將值顯示在圖上


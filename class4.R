#R class 4_2017/09/02
#Array，和matrix一樣，資料型態必須統一。適合用於儲存panel data
arr <- array(1:24, dim = c(2, 3, 4))  #創造4個2*3的矩陣
class(arr)
arr[, , 1]  #看第1個矩陣
arr[, , 1][, 1]  #看第1個矩陣的第1個column
arr[, 1, 1]  #看第1個矩陣的第1個column
class(iris3)  #iris3為用aaray儲存的iris
iris3[, , "Setosa"]  #將setosa的矩陣選出來

#List
genre <- "Sitcom"
created_by <- c("David Crane", "Marta Kauffman")
starring <- c("Jennifer Aniston", "Lisa Kudrow", "Courtney Cox", "Matt LeBlanc", "Matthew Perry", "David Schwimmer")
seasons <- 10
is_airing <- FALSE
friends_df <- data.frame(genre, created_by, starring, seasons, is_airing)  #嘗試用dataframe儲存資訊
View(friends_df)  #data長度不同會重複出現
friends_list <- list(genre, created_by, starring, seasons, is_airing)  #用list儲存資訊
class(friends_list)
friends_list
friends_list[[3]]  #看starring的資訊
friends_list[[3]][5]  #看starring中的第5個
friends_list <- list(Genre = genre, Created_by = created_by, Starring = starring, Seasons = seasons, Is_airing = is_airing)  #讓list可以用名稱來索引
friends_list$Starring[5]  #看starring中的第5個
friends_list$Role <- c("Rachel Green", "Phebe Buffay", "Monica Geller", "Joey Tribbiani", "Chandler Bing", "Ross Geller")
friends_list$Cast_df <- data.frame(starring = friends_list$Starring, role = friends_list$Role)
friends_list$F_list <- friends_list  #list裡可以儲存list


say_hello <- function(){  
  to_r <- "Hello R!"
  to_world <- "Hello World!"
  return(list(tor = to_r, tow = to_world)
         )
}   
say_hello()  #利用list可以回傳多個輸出

lm_fit <- lm(dist ~ speed, cars)  #函式幾乎都是以list為輸出
lm_fit$residuals

#R語言繪圖
x <- seq(-5, 5, by = 0.1) #產生-5到5之間，公差為0.1的值
y <- x**2
plot(x, y)
plot(x, y, xlim = c(-10, 10), ylim = c(-5, 30), main = "y = x^2", sub = "Fig.1", xlab = "x", ylab = "y", pch = 23, type = "l", lty = 6, lwd = 3)  #設定x, y的界線，主、副標題，x, y軸的標籤、標記形狀、描繪線條、線條樣式、線條寬度
plot(x, y, xlim = c(-10, 10), ylim = c(-5, 30), main = "y = x^2", sub = "Fig.1", xlab = "x", ylab = "y", pch = 23, type = "p", cex = 3)  #描繪點、點大小
plot(x, y, xlim = c(-10, 10), ylim = c(-5, 30), main = "y = x^2", sub = "Fig.1", xlab = "x", ylab = "y", pch = 23, type = "l", lty = 6, lwd = 3, col = "red", col.axis = "red", col.main = "blue")  #調整線條、x軸、主標題的顏色
?par  #查看和圖形相關的所有參數
par("pch")  #看pch參數的初始設定
par("las")  #看軸標籤的初始設定(和軸平行)
plot(x, y, xlim = c(-10, 10), ylim = c(-5, 30), main = "y = x^2", sub = "Fig.1", xlab = "x", ylab = "y", pch = 23, type = "l", lty = 6, lwd = 3, las = 1)  #將y軸的標籤改為垂直y軸
plot(x, y, xlim = c(-10, 10), ylim = c(-5, 30), main = "y = x^2", sub = "Fig.1", xlab = "x", ylab = "", pch = 23, type = "l", lty = 6, lwd = 3, las = 1)  #先把Y的標記拿掉
mtext("YY", side = 2, las = 1, line = 2)  #顯示YY，位於左邊，垂直Y軸

par("mar")
par(mar = c(1,1,0,0))  #調整下左上右的與邊界的距離
plot(x, y, xlim = c(-10, 10), ylim = c(-5, 30), main = "y = x^2", sub = "Fig.1", xlab = "x", ylab = "", pch = 23, type = "l", lty = 6, lwd = 3, las = 1)

dev.off()  #清除所有圖型，並還原參數設定

par("mfrow")
par(mfrow = c(2,2))  #將畫布切成2個row，2個column
plot(cars)
plot(cars)
plot(cars)
plot(cars)

plot(x, y, xlim = c(-10, 10), ylim = c(-5, 30), main = "y = x^2", sub = "Fig.1", xlab = "x", ylab = "", pch = 23, type = "l", lty = 6, lwd = 3, las = 1)
points(c(0, 0), pch = 17, col = "blue", cex = 1.5)  #把(0, 0)標記出來
text(0, 0, labels = "Global Min.")  #在(0,0)的地方加上文字

row.names(mtcars)  #將mtcars的row的名稱取出來
plot(mtcars$mpg, mtcars$hp, xlab = "mpg", ylab = "hp", xlim = c(min(mtcars$mpg)*0.4, max(mtcars$mpg)*1.6), ylim = c(min(mtcars$hp)*0.4, max(mtcars$hp)*1.6))  #將x, y軸的範圍定為最大最小值的一個比例
text(mtcars$mpg, mtcars$hp, labels = row.names(mtcars), cex = 0.5, pos = 1)  #把車子的名稱放到資料點下方

plot(iris$Sepal.Length, iris$Petal.Length, xlab = "Sepal L", ylab = "Petal L", col = iris$Species)  #以顏色區分種類
legend("bottomright", legend = c("Set", "Vir", "Ver"), col = 1:3, pch = 1)  #在右下角放圖例，col設1:3是因爲iris的Species是factor，且分別為1, 2, 3，故讓col = 1:3，剛好對應3種species
class(iris$Species)
as.integer(iris$Species)

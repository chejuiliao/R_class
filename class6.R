#R class 6_2017/09/09
library("ggplot2")  #載入ggplot2套件
data()  #ggplot2也有給一些data set可以練習

#用ggplot2畫散布圖
ggplot(cars, aes(x = speed, y = dist)) +  #畫data的底圖，aes輸入x, y座標要畫的東西，+號後面為要加的東西
  geom_point(col = "red", pch = 21) +  #用點的方式描繪，點為紅色，base plot裡的函數仍然可以使用
  geom_smooth(method = "lm", se = FALSE) +  #畫出直線趨勢線，不要畫出信賴區間
  ggtitle("Cars data") +  #加上title
  xlab("Speed") +
  ylab("Dist")

ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, col = Species)) +  #根據species標不同顏色
  geom_point()

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point()

#用ggplot2畫線圖
ggplot(economics, aes(x = date, y = unemploy)) +
  geom_line()

#畫直方圖
set.seed(87)
rand_norm <- rnorm(10000)  #由normal distribution產生10000組資料
rand_norm_df <- data.frame(rand_norm = rand_norm)  #存成dataframe，因爲ggplot只接受dataframe和list
ggplot(rand_norm_df, aes(x = rand_norm)) +
  geom_histogram(binwidth = 0.2)  #設定bin的寬度(應按照data的range來設定)

ggplot(iris, aes(x = Sepal.Length, fill = Species)) +  #以species的類型來填滿直方圖的顏色
  geom_histogram(binwidth = 0.2) +
  facet_wrap(~Species, nrow = 3)  #切開不同species的分佈，分享x軸

ggplot(diamonds, aes(x = carat)) +
  geom_histogram(binwidth = 0.01)

#畫盒須圖
ggplot(diamonds, aes(x = cut, y = price, color = cut)) +  #x設為要展開的變數
  geom_boxplot()

#函數圖
sin_df <- data.frame(x = c(-pi, pi))
ggplot(sin_df, aes(x = x)) +
  stat_function(fun = sin, geom = "line")

#長條圖
ggplot(mtcars, aes(x = gear)) +  #畫出來的y預設為類別變數的count
  geom_bar()

ggplot(mtcars, aes(x = row.names(mtcars), y = hp)) +
  geom_bar(stat = "identity") +  #自己訂y
  coord_flip()  #將圖轉為水平

diamonds_copied <- diamonds
diamonds_copied$cut <- factor(diamonds_copied$cut, ordered = TRUE, levels = c("Fair", "Good", "Ideal", "Premium", "Very Good"))
head(diamonds_copied$cut)
ggplot(diamonds, aes(x = cut, y = price, color = cut)) +  #x設為要展開的變數
  geom_boxplot()  #ggplot2會照level順序來畫圖

mtcars_copied <- mtcars[order(mtcars$hp),]  #將mtcars依據hp排序
mtcars_copied$name <- factor(row.names(mtcars_copied), ordered = TRUE, levels = row.names(mtcars_copied))  #創造一個儲存name的變數，並以factor儲存，且依照排序後的name來設level
class(mtcars_copied$name)
ggplot(mtcars_copied, aes(x = name, y = hp)) +
  geom_bar(stat = "identity") +
  coord_flip()

#用ggplot2畫多個圖
library(gridExtra)
gg1 <- ggplot(mtcars, aes(x = gear)) +
  geom_bar()
gg2 <-ggplot(iris, aes(x = Sepal.Length, fill = Species)) +
  geom_histogram(binwidth = 0.2) +
  facet_wrap(~Species, nrow = 3)
grid.arrange(gg1, gg2, nrow = 2)

library(plotly)
ggplotly(gg2)  #產生有互動效果的圖

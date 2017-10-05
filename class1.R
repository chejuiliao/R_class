#R class 1_2017/08/23
#RStudio為編輯器(整合開發工具)
#Ctrl+L  清空console
#ESC  跳出+
#!  not
#\  跳脫
#沒有雙引號的文字會被視為物件
rm(list = ls())  #清空所有變數
ls()  #回傳所有變數
write.csv(iris, file = "iris.csv")  #存出一個叫iris的csv檔
iris.csv <- read.csv("iris.csv")  #讀取一個叫iris的csv檔
getwd()  #看目前工作位置
setwd()  #更換目前工作位置
class()  #查變數型態
print("hello")  #顯示hello
plot(iris)  #畫圖
summary(iris)  #看資料的統計資訊
my_first_name <- "Jerry"  #指派值給變數
my_last_name <- "Liao"
my_age <- 23
my_gender <- "male"
my_height <- 170
my_weight <- 54
my_BMI <- my_weight / ((my_height / 100) ^ 2)
print(my_BMI)

bmi_calculator <- function(my_height, my_weight){
  return(my_weight / ((my_height / 100) ^ 2))
}  #自訂函數
my_height <- 170
my_weight <- 54
print(bmi_calculator(my_height, my_weight))

mcd <- 'I\'m loving it' #用\告訴R後面的符號是要顯示的

sentence <- "You \"accidently\" proposed to Rachel"
sentence
writeLines(sentence)
print(sentence)

8 %in% 1:10  #判斷8是否在1-10之中

my_age <- 20

class(8.1 + 7L)  #以最高階變數型態儲存

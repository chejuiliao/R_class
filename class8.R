#R class 8_2017/09/16
#新增觀測值
load(url("https://storage.googleapis.com/r_rookies/straw_hat_df.RData"))  #讀進data
jinbe <- c("Jinbe", "Male", "Shichibukai", 400000000, 46, "04-02", 301)  #向量只能存一種變數型態，因爲裡面有字串，所以全都被轉為字串
straw_hat_df <- rbind(straw_hat_df, jinbe)  #多加入一個觀測值
str(straw_hat_df)  #原本為numeric的欄向量變為character
straw_hat_df$age <- as.integer(straw_hat_df$age)  #將age改為integer

load(url("https://storage.googleapis.com/r_rookies/straw_hat_df.RData"))  #讀進data
!straw_hat_df$gender == "Male"  #篩選出女性
straw_hat_df[!straw_hat_df$gender == "Male", ]
subset(straw_hat_df, subset = gender != "Male", select = c("name", "gender"))  #subset選row，select選column

birth_year <- as.integer(format(Sys.Date(), "%Y")) - as.integer(straw_hat_df$age)
birth_date <- paste(birth_year, straw_hat_df$birthday)  #將birth_year和birthday結合
#birth_date <- sprintf("%s-%s", birth_year, straw_hat_df$birthday)  用sprinf也可以結合字串
birth_date <- as.Date(birth_date, format = "%Y %m-%d")  #將資料轉為Date
straw_hat_df$birth_date <- birth_date

#長寬表格轉換
#寬表格：
#name   age   height   weight
#Luffy  21     174      62
#長表格：
#name   key   value
#Luffy  age    21
#Luffy  height 174
#Luffy  weight 62
#Luffy  attack 1000
library(tidyr)
library(ggplot2)
wide_df <- subset(straw_hat_df, select = c("name", "age", "height"))  
long_df <- gather(wide_df, key = KEY, value = VALUE, age, height)  #將寬表格轉為長表格
View(long_df)
wide_transposed <- spread(long_df, key = KEY, value = VALUE)  #將長表格轉換為寬表格
View(wide_transposed)
ggplot(long_df, aes(x = factor(name), y = VALUE, fill = KEY)) +
  geom_bar(stat = "identity", position = "stack")  #用長表格可以簡單畫多個變數

econ_long <- gather(economics, key = macros, value = indicators, psavert, uempmed)  #將economics轉換為長表格
View(econ_long)
econ_long <- subset(econ_long, select = c("date", "macros", "indicators"))  #選出要的變數
ggplot(econ_long, aes(x = date, y = indicators, color = macros)) +
  geom_line()  #將兩個變數同時畫出

#合併資料框
load(url("https://storage.googleapis.com/r_rookies/straw_hat_df.RData"))
load(url("https://storage.googleapis.com/r_rookies/straw_hat_devil_fruit.RData"))
left_df <- straw_hat_df
right_df <- straw_hat_devil_fruit
inner_joined <- merge(left_df, right_df)  #merge可以將兩個資料結合
View(inner_joined)  #merge預設只會保留兩邊都有的資料
left_joined <- merge(left_df, right_df, all.x = TRUE)  #保留left_df的所有資料
View(left_joined)
right_joined <- merge(left_df, right_df, all.y = TRUE)  #保留right_df的所有資料
View(right_joined)
full_joined <- merge(left_df, right_df, all.x = TRUE, all.y = TRUE)  #保留兩邊的所有資料
View(full_joined)


#讀取不同資料格式
file_path <- "/Users/jerryliao/Downloads/iris.csv"
iris_csv <- read.csv(file_path)  #讀取csv檔
iris_csv <- read.table(file_path, sep = ",", header = TRUE)  #用read.table要設定分隔符號，並將第一列作為變數名稱

writeLines("Hello\tWorld")  #看tab在R裡面的顯示
writeLines("Hello\nWorld")  #看換行在R裡面的顯示

library(readxl)
excel_file <- "/Users/jerryliao/Downloads/iris.xlsx"
iris_xlsx <- read_excel(excel_file)
View(iris_xlsx)

library(haven)
smoking_sas_data <- read_sas("http://storage.googleapis.com/r_rookies/smoking.sas7bdat")
View(smoking_sas_data)

library(jsonlite)
#當多個套件有同一個函數名稱時，用"套件名稱::函數名稱"來精準呼叫函數
friends_json <- '{
  "genre": "Sitcom",
"seasons": 10,
"episodes": 236,
"stars": ["Jennifer Aniston", "Courteney Cox", "Lisa Kudrow", "Matt LeBlanc", "Matthew Perry", "David Schwimmer"]
}'
friends <- jsonlite::fromJSON(friends_json)  #將json資料結構讀進R語言
friends$stars[1]

starring_json <- '[
  {"character": "Rachel Green", "star": "Jennifer Aniston"},
{"character": "Monica Geller", "star": "Courteney Cox"},
{"character": "Phoebe Buffay", "star": "Lisa Kudrow"},
{"character": "Joey Tribbiani", "star": "Matt LeBlanc"},
{"character": "Chandler Bing", "star": "Matthew Perry"},
{"character": "Ross Geller", "star": "David Schwimmer"}
]'
friends <- jsonlite::fromJSON(starring_json)

#迴圈
#for：有固定迭代的長度
#while：持續迴圈直到判斷條件不符合
month.name
for(i in month.name){  #i在month.name裡面跑
  print(i)
}

for(idx in 1:12){  #idx在1-12裡面跑
  print(month.name[idx])
}

i <- 1
while(i <= 12){
  print(month.name[i])
  i <- i + 1
}

sum <- 0
for(i in 1:100){
  sum <- sum + i
}
sum

i <- 1
sum <- 0
while(i <= 100){
  sum <- sum + i
  i <- i + 1
}
sum
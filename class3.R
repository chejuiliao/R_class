#R class 3_2017/08/30
#Factor - 儲存帶有層級的文字
char_vector <- c("Red", "Green", "Blue", "Blue", "Red")
rgb_factor <- factor(char_vector)  #會給予文字unique value
summary(rgb_factor)  #看相異值的分佈
rgb_factor <- factor(char_vector, levels = c("Red", "Green", "Blue")) #自己定義factor的層級
rgb_factor
rgb_factor[2] > rgb_factor[3]
speed_factor <- factor(c("Fast", "Moderate", "Slow", "Slow", "Fast"), ordered = TRUE) #讓factor產生排序
speed_factor
class(speed_factor)
speed_factor <- factor(c("Fast", "Moderate", "Slow", "Slow", "Fast"), ordered = TRUE, levels = c("Slow", "Moderate", "Fast"))
speed_factor
speed_factor[2] > speed_factor[3]
temp_factor <- factor(c("Cold", "Warm", "Hot", "Cold", "Hot"), ordered = TRUE, levels = c("Cold", "Warm", "Hot"))
temp_factor[1] > temp_factor[2]
as.integer(temp_factor)
#R語言通常預設文字向量為factor
#若會有新的值，用character才不會被level限制，factor定義完之後就沒辦法加入新的值
temp_char <- c("Hot", "Cold", "Warm")
df <- data.frame(temp = temp_char)
str(df) #查看data frame裡的資料結構
rbind(df, "Freezing")  #factor因為levels一開始就assign好，無法加入新的值

df_char <- data.frame(temp = temp_char, stringsAsFactors = FALSE)  #不以factor儲存文字向量
rbind(df_char, "Freezing")  #可以加入新的值
df_char

#Matrix
my_matrix <- matrix(1:6, nrow = 3, ncol = 2) #產生一個3(row)x2(column)的矩陣，並放入1-6
dim(my_matrix) #看matrix的維度
matrix(1:8, ncol = 2) #可以只給row或column的個數
matrix(1:8, ncol = 2, byrow = TRUE) #將1-8的值以row的為單位填滿
matrix(1:8, ncol = 2, byrow = TRUE)[, 1] #看第1個column的數字
matrix(1:8, ncol = 2, byrow = TRUE)[2, ] #看第2個row的數字
matrix(1:8, ncol = 2, byrow = TRUE)[3, 2] #看第3個row，第4個column的數字

my_matrix <- matrix(1:30, ncol = 5)
logical_matrix <- my_matrix < 10 #儲存matrix內符合條件的邏輯值
my_matrix[logical_matrix] #看matrix內< 10的元素
logical_matrix <- my_matrix < 10 | my_matrix > 20
my_matrix[logical_matrix]
my_matrix[, 1, drop = FALSE] #取第1個column並維持matrix的結構
my_matrix[1:3, ] #取1-3個row
my_matrix[c(1, 4, 5), ] #取第1, 4, 5個row

matrix(c(1, "2", TRUE, FALSE), nrow = 2) #matrix一樣會將不同變數型態統一為最高級
mat_1 <- matrix(1:4, nrow = 2)
mat_2 <- matrix(5:8, nrow = 2)
mat_1 * mat_2 #只是各元素相對位置相乘
mat_1 %*% mat_2 #mat_1和mat_2內積

#Dataframe
df <- data.frame(team_name = "Chicago Bulls", season = "1995-96", wins = 72, losses = 10, is_champion = TRUE)
dim(df)
class(df)
df[, 1] #選取第1個column，資料結構為factor
df[, 3] #選取第1個column，資料結構為數字
df <- data.frame(team_name = "Chicago Bulls", season = "1995-96", wins = 72, losses = 10, is_champion = TRUE, stringsAsFactors = FALSE) #不要讓vector自動變為factor
class(df[, 1]) #第1個column變成character
lapply(df, FUN = class) #看df各column的class
str(df) #看df的結構

name <- c("蒙其D魯夫", "羅羅亞索隆", "娜美", "賓什莫克香吉士")
is_female <- c(FALSE, FALSE, TRUE, FALSE)
age <- c(19, 21, 20, 21)
df <- data.frame(Name = name, Is_Female = is_female, Age = age, stringsAsFactors = FALSE)
View(df) #用表格顯示df
df[1, ] #顯示第1個row的元素
df[ , 2, drop = FALSE] #顯示第2個column的元素，並保留dataframe的結構
#選出女性
df[3, ] #想要選的
df[c(FALSE, FALSE, TRUE, FALSE), ] #邏輯值表達
df[, "Is_Female"] == TRUE
df[df[, "Is_Female"] == TRUE, ]
subset(df, Is_Female == TRUE, c(Name, Is_Female)) #顯示Is_Female為TRUE的Name和Is_Female
#小於21歲
df[, "Age"] < 21
df[df[, "Age"] < 21, ]
df$Age < 21 #取出Age這個變數，看是否小於21
df[df$Age < 21, ] #顯示Age < 21的row
df[df$Age < 21, "Name"] #顯示Age < 21的Name
subset(df, Age < 21)

data() #看R語言內建的資料結構
iris
dim(iris)
nrow(iris)
ncol(iris)
str(iris)
head(iris )
tail(iris, n = 8)
names(iris)
View(iris)


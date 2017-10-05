#R class 2_2017/08/26
#變數的運算
class(8.7 + 8L) #判斷整數加小數的資料型態，會以較高階層儲存
TRUE + 8.7 #TRUE會儲存為1; FALSE會儲存為0
"Tony" + "Kuo" #文字無法運算
paste("Tomy", "Kuo") #讓文字相加
strrep("R", times = 7) #複製文字

#變數判斷及轉換
is.integer(8) #判斷8是否為整數
as.integer(8.7) #將8.7轉換為整數(直接捨去小數點)
as.integer(TRUE) #邏輯值轉換為數字會變1 or 0
as.numeric("8.7") #文字形態的數字可以轉換為數字
as.numeric("a") #文字無法轉換為數字
as.logical(5566) #只有0會得到FALSE
as.character(8+7i) #所有東西可以被轉換為文字

#日期
Sys.Date() #產出今天的日期
Sys.Date() - 1 #日期可以運算
as.integer(Sys.Date()) #將日期轉換為數字
Sys.Date() - 17404 #系統基準日
earth_quake <- "1999-09-21"
as.Date(earth_quake) #把earth_quake轉換成日期
class(as.Date(earth_quake))
format(Sys.Date(), "%Y%B%A") #以特定format輸出日期

#日期時間
Sys.time() #目前的系統時間
as.integer(Sys.time()) #將時間轉換為數字
Sys.time() - as.integer(Sys.time()) #系統基準時間
class(Sys.time())
as.POSIXct("1970-01-01 00:00:00", tz = "GMT") 
as.integer(as.POSIXct("1970-01-01 00:00:00", tz = "GMT"))

#()的功能
#1. Function call e.g. class()
#2. Priority e.g. (4+7)*2
#[]的功能
#1. Indexing
#{}的功能 
#1. code block

Sys.getlocale() #看目前的locale

#資料結構
#一維:vector, factor
#二維
#多維

seasons <- c("spring", "summer", "autumn", "winter") #創造一個向量
seasons[1] #R的索引值從1開始
seasons[-2] #拿掉第2個元素
seasons[3:4] #輸出3-4的元素
seasons[c(1,4)] #輸出第1和4個元素
nchar(seasons[1]) #計算第1個元素的字母個數
nchar(seasons) #同時計算vector內的所有元素字母個數
toupper(seasons) #使vector內的元素變大寫字母

friends_vec <- c("SitCom", 10, 236, FALSE) #將不同變數型態存入vector
class(friends_vec) #vector只容許一種變數型態

seq(from = 1, to = 13, by = 3) #產出一組數列從1-13，公差為3
rep(7, times = 8) #產出一組數列有8個7

#Indexing的選取-position or logical
(101:200) > 157 #看101-200內有哪些大於157
gt_157 <- (101:200) > 157 #將邏輯值儲存
(101:200)[gt_157] #顯示101-200中大於157的數字
lt_130 <- (101:200) < 130 #判斷哪些小於130
(101:200)[gt_157 | lt_130] #顯示101-200中大於157或小於130的數字
(101:200) %% 3 != 0 #判斷哪些不是3的倍數
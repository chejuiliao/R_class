#R class 7_2017/09/13
load(url("https://storage.googleapis.com/r_rookies/straw_hat_df.RData"))  #讀進data
sys_date <- Sys.Date()

sys_year <- substr(sys_date, start = 1, stop = 4)  #將年的部分取出
sys_year

sys_year <- strsplit(as.character(sys_date), split = "-")  #用-將字串切割
sys_year <- sys_year[[1]][1]  #將年的部分取出

sys_year <- format(sys_date, "%Y")  #以年的方式取出sys_date
sys_year

sys_year <- as.integer(sys_year)  #將年轉為數字
straw_hat_df$birth_year <- sys_year - straw_hat_df$age  #創造一個新的欄位
View(straw_hat_df)

straw_hat_df$favorite_food <- c("Meat", "Food matches wine", "Orange", "Fish", "Food matches black tea", "Sweets", "Food matches coffee", "Food matches coke", "Milk")  #再增加一個欄位

straw_hat_df$birth_year <- NULL  #將birth_year這個欄位刪除
straw_hat_df[, -1]  #不要第1欄

load(url("https://storage.googleapis.com/r_rookies/straw_hat_df.RData"))
straw_hat_df$age
ifelse(straw_hat_df$age >= 30, "大於30", "未滿30")  #將年齡以30來分箱
cut(straw_hat_df$age, breaks = c(0, 20, 30, Inf), labels = c("小於20", "20-30", "大於30"))


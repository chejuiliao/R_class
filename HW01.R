#HW01
#Question 1
beyond_start <- as.Date("1983-12-31") #將1983-12-31這個日期儲存到beyond_start這個變數裡
beyond_start

#Question 2
big_year <- sum((1984:2017) %% 4 == 0) #計算1994-2017有多少閏年
as.integer((Sys.Date() - beyond_start - big_year) / 365 +1) #計算今天和beyond_start差多少天，扣除閏年個數，再除以365得到年數，加1後取整數

#Question 3
major_quake_time <- "1999-09-21 01:47:16" #將1999-09-21 01:47:16這個字串儲存到major_quake_time
major_quake_time

#Question 4
first_aftershock_time <- "1999-09-21 01:57:15" #將1999-09-21 01:57:15這個字串儲存到first_aftershock_time
first_aftershock_time

#Question 5
difftime(as.POSIXct(first_aftershock_time), as.POSIXct(major_quake_time), units = "secs") #計算餘震和地震的時間差，以秒數表達
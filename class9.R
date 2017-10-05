#R class 8_2017/09/20
sum <- 0
cnt <- 0
for (num in 1:100){
  sum <- sum + num  #計算總和
  cnt <- cnt + 1  #計算項數
}
sum
cnt
avg <- sum / cnt  #計算平均

#畫iris不同變數的boxplot
iris_var <- names(iris)
iris_var <- sub("\\.", " ", iris_var)  #把.換成空格
par(mfrow = c(2, 2))
for (i in 1:4){
  boxplot(iris[, i] ~ iris[, 5], main = paste(iris_var[i], "by species"))
}

#製作撲克牌
poker_cards <- c()  #用來存poker
poke_suit <- c("club", "diamond", "heart", "spade")  #撲克牌的4種花色
poke_num <- 1:13  #每個花色有13個數字
for(suit in poke_suit) {
  for(num in poke_num) {
    print(sprintf("%s %s", suit, num))  #將suit和num貼在一起
    poker_cards <- c(poker_cards, sprintf("%s %i", suit, num))
  }
}
poker_cards

#製作99乘法表
mat_99 <- matrix(nrow = 9, ncol = 9)
for (j in 1:9) {
  for (i in 1:9) {
    mat_99[i, j] <- paste(i, "x", j, "=", i * j)
  }
}

#投擲硬幣
coin <- c("Head", "Tail")
logs <- c()
cnt <- 0
while (sum(logs == "Head") < 3){  #logs == "Head"時為TRUE
 logs <- c(logs, sample(coin, size = 1))  #儲存投擲紀錄
}
length(logs)  #看總共投了幾次

sample(1:10)  #sample預設的size為資料總數
sample(1:10, replace = TRUE)  #若replace為TRUE則每抽一個就會放回，故會抽出一樣的值

#創造撲克牌
poker_cards <- c()  #用來存poker
poke_suit <- c("club", "diamond", "heart", "spade")  #撲克牌的4種花色
poke_num <- 1:13  #每個花色有13個數字
for(suit in poke_suit) {
  for(num in poke_num) {
    print(sprintf("%s %s", suit, num))  #將suit和num貼在一起
    poker_cards <- c(poker_cards, sprintf("%s %i", suit, num))
  }
}

#抽撲克牌
shuffled_poker_cards <- poker_cards[sample(1:52)]  #洗牌
poker_card_logs <- c()
while((sum(poker_card_logs == "spade 2")) < 1 ){
  poker_card_logs <- c(poker_card_logs, shuffled_poker_cards[1])
  shuffled_poker_cards <- shuffled_poker_cards[-1]
}
length(poker_card_logs)  #看抽了幾次
poker_card_logs

#流程控制
weather = sample(c("晴天", "多雲", "毛毛雨", "狂風", "暴雨", "下雪", "打雷閃電"), size = 1)
if (weather %in% c("晴天", "多雲")) {  #weather為晴天或多雲
 print(paste0("天氣是", weather, "，", "去戶外跑步"))  #連接不會有空格 
} else if (weather == "毛毛雨" | weather == "狂風") {  #weather為毛毛雨或狂風
  print(paste0("天氣是", weather, "，", "去健身房"))
}else {
  print(paste0("天氣是", weather, "，", "在家當沙發馬鈴薯")) 
} 

#break會直接使迴圈中止
#next會跳到下個值並繼續迴圈

for(i in 1:100){
  if (i %% 15 == 0) {
    print("15的倍數")
    } else if (i %% 5 == 0) {
    print("5的倍數")
    } else if(i %% 3 == 0) {
    print("3的倍數")
    } else {
      print(i)
    }
}

factor_87 <- c()
for(i in 1:87) {
  if (87 %% i == 0) {
    factor_87 <- c(factor_87, i)
  }
}
factor_87
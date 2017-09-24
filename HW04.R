# R class HW04
# 計算投擲骰子得到3次6點需要多少次，並紀錄投擲過程
six <- 0
dice_result <- c()
while(six < 3){  #持續投擲直到出現3個6點
  dice <- sample(1:6, size = 1)  #從1-6中抽取一數字(投擲骰子)
  dice_result <- c(dice_result, dice)  #儲存投擲結果
  if(dice == 6){  #若結果為6，則增加一個6點
    six <- six + 1
  }
}

print(paste("需投擲", length(dice_result), "次"))
print("投擲紀錄為:")
print(dice_result)
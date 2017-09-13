#HW03
#用ggplot2，用2x2的網格畫4個圖
library(ggplot2)
animals <- c(rep("cat", 3), rep("dog", 3), rep("lion", 3), rep("elephant", 3))
condition <- rep(c("normal", "stress", "relax"), 4)
birth <- abs(rnorm(12, 3, 6))
data <- data.frame(animals, condition, birth)
View(data)
ggplot(data, aes(x = animals, y = birth, fill = condition)) +
  geom_bar(position = "dodge", stat = "identity")
ggplot(data, aes(x = animals, y = birth, fill = condition)) +
  geom_bar(stat = "identity")
ggplot(data, aes(x = animals, y = birth, fill = condition)) +
  geom_bar(stat = "identity", position = "fill")

setwd("~/Studia/Magister/Semestr I/Analiza Procesów Uczenia/Lab03")

install.packages("neuralnet")
library("neuralnet")

trainingInput <- as.data.frame(
  matrix(
    c(32, 1000,
      16, 500,
      8, 256,
      64, 500,
      32, 500,
      64, 1000,
      16, 500,
      8, 256,
      64, 500,
      32, 500),
    nrow= 10,
    ncol=2))

trainingOutput <- c(4000, 3000, 1100, 2200, 2500, 4200)
trainingOutput <- c(4000, 3000, 1100, 2200, 2500, 4200, 3200, 1900, 2300, 3200)

maxs <- apply(trainingInput[,1:2], 2, max)
mins <- apply(trainingInput[,1:2], 2, min)

scaled.trainingInput <- as.data.frame(scale((trainingInput[,1:2]), center = mins, scale = maxs - mins))

print(head(scaled.trainingInput, 10))

trainingData <- cbind(scaled.trainingInput, trainingOutput)
colnames(trainingData) <- c("RAM", "HDD", "Price")
print(trainingData)

net.price <- neuralnet(Price ~ RAM + HDD, trainingData, hidden = c(3, 2), threshold = 0.01)
print(net.price)

plot(net.price)

testData <- as.data.frame(matrix(
  c(64, 1000, 32, 500, 8, 100),
  nrow = 3,
  ncol = 2
))

scaled.testData <- as.data.frame(scale(testData[,1:2], center = mins, scale = maxs - mins))

net.results <- compute(net.price, scaled.testData)

ls(net.results)

print(net.results$net.result)

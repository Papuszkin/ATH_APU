setwd("~/Studia/Magister/Semestr I/Analiza Procesów Uczenia/Lab03")

install.packages("neuralnet")
library("neuralnet")

trainingInput <- as.data.frame(
  matrix(
    c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
    nrow= 10,
    ncol=1))

trainingOutput <- c(0, 1.386294, 2.197224, 2.772588, 3.218875, 3.583518, 3.891820, 4.158883, 4.394449, 4.605170)

maxs <- max(trainingInput)
mins <- min(trainingInput)

scaled.trainingInput <- as.data.frame(scale((trainingInput), center = mins, scale = maxs - mins))

print(head(scaled.trainingInput, 10))

trainingData <- cbind(scaled.trainingInput, trainingOutput)
colnames(trainingData) <- c("In", "Out")
print(trainingData)

net.mathAPR <- neuralnet(Out ~ In, trainingData, hidden = c(12, 5), threshold = 0.0001)
print(net.mathAPR)

plot(net.mathAPR)

testData <- as.data.frame(matrix(
  c(8, 9, 10, 11, 12),
  nrow = 6,
  ncol = 1
))

scaled.testData <- as.data.frame(scale(testData, center = mins, scale = maxs - mins))

net.results <- compute(net.mathAPR, scaled.testData)

ls(net.results)

print(net.results$net.result)


setwd("~/Studia/Magister/Semestr I/Analiza Procesów Uczenia/Lab03")

install.packages("neuralnet")
library("neuralnet")

trainingInput <- as.data.frame(read.csv("~/Studia/Magister/Semestr I/Analiza Procesów Uczenia/Lab03/lodowki.csv"))

trainingOutput <- as.data.frame(trainingInput[,5])

trainingInput <- trainingInput[,3:4]

maxs <- apply(trainingInput, 2, max)
mins <- apply(trainingInput, 2, min)

scaled.trainingInput <- as.data.frame(scale((trainingInput), center = mins, scale = maxs - mins))

print(head(scaled.trainingInput, 10))

trainingData <- cbind(scaled.trainingInput, trainingOutput)
trainingData <- cbind(scaled.trainingInput, as.data.frame(scale(trainingOutput, center = min(trainingOutput), scale = max(trainingOutput - min(trainingOutput)))))
colnames(trainingData) <- c("poj_chl", "poj_zam", "cena")
print(trainingData)

net.cenaAPR <- neuralnet(cena ~ poj_chl + poj_zam, trainingData, hidden = c(7, 18, 20, 10, 5), threshold = 0.001)
print(net.cenaAPR)

plot(net.cenaAPR)

testData <- as.data.frame(matrix(
  c(388, 277, 197, 239, 276, 206, 107, 98, 104, 114),
  nrow = 5,
  ncol = 2
))

scaled.testData <- as.data.frame(scale(testData, center = mins, scale = maxs - mins))
colnames(scaled.testData) <- c("poj_chl", "poj_zam")

net.results <- compute(net.cenaAPR, scaled.testData)


#ls(net.results)

#print(net.results$net.result)

print(net.results$net.result * max(trainingOutput - min(trainingOutput)) + min(trainingOutput))


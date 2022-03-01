setwd("~/Studia/Magister/Semestr I/Analiza Procesów Uczenia/Lab04")

install.packages("C50")
require("C50")

lodowki <- read.csv("lodowki.csv")

lodowki <- lodowki[, 2:8]
lodowki[, 6] <- factor(lodowki[, 6])
lodowki[, 7] <- factor(lodowki[, 7])

model <- C5.0(lodowki[, -7], lodowki[, 7])

plot(model)

model

summary(model)

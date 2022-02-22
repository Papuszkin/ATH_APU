a <- 4*sin(pi)
b <- a * 3
max(a, b)
help(max)
vecA <- 90:115
sum(vecA^2)/length((vecA))
apropos("max", mode = "function")
setwd("~/Studia/Magister/Semestr I/Analiza Procesów Uczenia/Lab01")
a <- "lodówka z najwiêksz¹ pojemnoœci¹"
save(a, file="aCopy.RData")
remove(a)
a
load("aCopy.RData")
a
install.packages("gridExtra")
library(gridExtra)
help(package = "gridExtra")
grid.table(rivers[1:10])
seq(1000, 850, -2)
a <- 30:5
b <- 11:23
d <- c(b,a)

nazwa <- c("Whirlpool WQ9 B2L", "LG GBB72MCDGN", "Indesit LI7 SN1E X", "Whirlpool W7 821O K", "Samsung RB38T603CS9", "LG GSJ761MCUZ", "LG GBB61BLHMN", "Haier 3-drzwiowa HTR5619ENMP", "Samsung RB29FWJNDBC", "Samsung RS50N3913BC")
pojemnosc_uzytkowa_chlodziarki <- c(388, 277, 197, 239, 276, 411, 324, 234, 212, 360)
pojemnosc_uzytkowa_zamrazarki <- c(206, 107, 98, 104, 114, 214, 107, 114, 108, 175)
cena <- c(4470.69, 2438.19, 1299.99, 1747.14, 2999.00, 4633.29, 2031.69, 2925.99, 1828.44, 4470.69)
liczba_opinii <- c(27, 10, 30, 122, 146, 153, 129, 56, 46, 76)
lodowki <- data.frame(nazwa, pojemnosc_uzytkowa_chlodziarki, pojemnosc_uzytkowa_zamrazarki, cena, liczba_opinii, stringsAsFactors = FALSE)
mean(lodowki$cena)

nowa_lodowka <- data.frame(nazwa = "Samsung RB29FERNCSS", pojemnosc_uzytkowa_chlodziarki = 194, pojemnosc_uzytkowa_zamrazarki = 108, cena = 1787.79, liczba_opinii = 703)
lodowki <- rbind(lodowki, nowa_lodowka)

ocena <- c(5, 5, 5, 4.5, 5, 5, 5, 5, 4.5, 5, 5)
lodowki <- cbind(lodowki, ocena)
tapply(lodowki$cena, lodowki$ocena, mean)

nazwa = c("LG GSJ361DIDV", "Whirlpool W4D7 XC2", "Indesit LI8 S1E K", "Samsung RB34T672DBN")
pojemnosc_uzytkowa_chlodziarki = c(400, 302, 228, 230)
pojemnosc_uzytkowa_zamrazarki = c(206, 150, 111, 114)
cena <- c(3901.59, 2925.99, 1259.34, 1950.39)
liczba_opinii = c(371, 13, 27, 126)
ocena <- c(5, 5, 5, 5)
nowe_lodowki <- data.frame(nazwa, pojemnosc_uzytkowa_chlodziarki, pojemnosc_uzytkowa_zamrazarki, cena, liczba_opinii, ocena, stringsAsFactors = FALSE)
lodowki <- rbind(lodowki, nowe_lodowki)

oceny_wykres <- table(lodowki$ocena)
oceny_wykres
barplot(oceny_wykres)

oceny_procenty <- oceny_wykres / sum(oceny_wykres)
pie(oceny_procenty)
install.packages("plotrix")
library(plotrix)
fan.plot(oceny_procenty, labels=names(oceny_wykres))

for (row in 1:nrow((lodowki))){
  liczba <- lodowki[row, "liczba_opinii"]
  
  if (liczba == 0) {
    lodowki[row, "status_opinii"] <- "Nie ma"
  } else if(liczba > 0 && liczba < 50) {
    lodowki[row, "status_opinii"] <- "mniej ni¿ 50 opinii"
  } else if(liczba > 50 && liczba < 100) {
    lodowki[row, "status_opinii"] <- "miêdzy 50-100 opinii"
  } else {
    lodowki[row, "status_opinii"] <- "wiecej ni¿ 100 opinii"
  }
}
lodowki$status_opinii



setwd("~/Studia/Magister/Semestr I/Analiza Procesów Uczenia/Lab02")

install.packages("data.tree")
install.packages("DiagrammeR")
install.packages("formattable")
install.packages("~/Studia/Magister/Semestr I/Analiza Procesów Uczenia/Lab02/ahp_0.2.12.tar.gz",repos=NULL,type = "source")
install.packages("devtools", dependencies = TRUE)

library(devtools)
devtools::install_github("gluc/ahp", build_vignettes = TRUE)

library(ahp)
library(data.tree)

AHPdata <- Load("~/Studia/Magister/Semestr I/Analiza Procesów Uczenia/Lab02/lodowkiAHP.yaml")

Calculate(AHPdata)
Visualize(AHPdata)
Analyze(AHPdata)
AnalyzeTable(AHPdata)


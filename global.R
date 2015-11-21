library(ggplot2)
food <- read.csv("foodconvv.csv", sep="`")
food[,1] <- gsub(" \\(", ", or ", food[,1])
food[,1] <- gsub("\\)", "", food[,1])
units <- read.csv("foodconvvv.csv", sep="`")
colnames(units) <- c("Milliliters", "Decimeters", "Liters", 
                     "teaspoon",  "Tablespoon", "Fluid Ounces", "Ounces", 
                     "Cups", "Pints", "Quarts", "Gallons", "Grams", "Pounds")
units$Liters <- as.numeric(1000)
units$Gallons <-as.numeric(3785)
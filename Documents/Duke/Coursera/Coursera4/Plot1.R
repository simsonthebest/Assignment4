library(dplyr)
library(data.table)
library(datetime)
#setwd("Duke/Coursera/Coursera4")
#input <- read.table("household_power_consumption.txt",header=T, sep=";", na.strings="?")
input <- input[input$Date %in% c("1/2/2007","2/2/2007"),] # element of used to subset
TimeData <-strptime(paste(input$Date, input$Time, sep=" "),"%d/%m/%Y %H:%M:%S")


#Plot figure 1
par(mfrow = c(1,1))
hist(input$Global_active_power, col = "red", xlab = "Global Active Power (killowatts)", ylab = "Frequency", main = "Global Active Power")
dev.copy(png,"Plot1.png")
dev.off()
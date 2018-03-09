library(dplyr)
library(data.table)
library(datetime)
#setwd("Duke/Coursera/Coursera4")
input <- read.table("household_power_consumption.txt",header=T, sep=";", na.strings="?")
input <- input[input$Date %in% c("1/2/2007","2/2/2007"),] # element of used to subset
TimeData <-strptime(paste(input$Date, input$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

#Plot figure 4
par(mfrow = c(2,2))
plot(TimeData,input$Global_active_power,ylab = "Global Active Power (killowatts)", type="n")
lines(TimeData,input$Global_active_power)

plot(TimeData,input$Voltage,ylab = "Voltage", type="n",xlab = "date/time")
lines(TimeData,input$Voltage)

plot(TimeData,input$Sub_metering_1,ylab = "Energy sub metering", type="n")
lines(TimeData,input$Sub_metering_1,col = "black")
lines(TimeData,input$Sub_metering_2,col = "red")
lines(TimeData,input$Sub_metering_3,col = "blue")
legend("topright",col=c("black","red", "blue"), lty = 1,legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) 

plot(TimeData,input$Global_reactive_power,ylab = "Global_reactive_power", type="n",xlab = "date/time")
lines(TimeData,input$Global_reactive_power,col = "black")

dev.copy(png,"Plot4.png")
dev.off()
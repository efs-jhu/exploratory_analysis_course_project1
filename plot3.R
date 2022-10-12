library(tidyverse)
library(lubridate)

data <- read.csv("C:/Users/BHPData/OneDrive - Johns Hopkins/Documents/TEMP/Exploratory Data Analysis/w1_project/household_power_consumption.txt",sep=";")

data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)
data <- data[year(data$Date)==2007 & month(data$Date)==2 ,]
data <- data[day(data$Date)==1 | day(data$Date)==2,]
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$datetime <- data$Date + data$Time

dev.new(width=10, height=5, unit="in")
plot(data$datetime,data$Sub_metering_1,type='l',xlab="",ylab="Energy sub metering")
lines(data$datetime,data$Sub_metering_2,col='red')
lines(data$datetime,data$Sub_metering_3,col='blue')
legend("topright",legend=c("sub_metering_1","sub_metering_2","sub_metering_3"), col=c("black","red","blue"),lty=c(1,1,1), ncol=1)


